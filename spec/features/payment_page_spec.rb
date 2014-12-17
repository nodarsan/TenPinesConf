require 'rails_helper'
require 'stripe_mock'
require 'stripe/errors/card_error'

describe 'Payment page' , :js => true do

  before do
    create(:mati_attendee_user)
    visit '#/login-attendee'
    fill_in 'email', with:'mmelendi@10pines.com'
    fill_in 'password', with:'otraPassword'
    click_button 'Submit'
  end

  def on_submit_payment(card_number, cvc, month, year, error_message)
    visit '#/payment'
    fill_in 'Card Number', with:card_number
    fill_in 'CVC', with:cvc
    fill_in 'Expiration (MM/YYYY)', with:month
    fill_in '/', with:year
    error = accept_alert do
      click_button 'Submit Payment'
    end
    expect(error).to eq(error_message)
  end

  it 'should raise an error because is an incorrect card number' do
    incorrect_card_number = ''
    on_submit_payment(incorrect_card_number,'123','11','2016',"Operation could not be completed:Your card number is incorrect.")
  end

  it 'should raise an error because is a declined card' do
    declined_card_number = '4000000000000002'
    on_submit_payment(declined_card_number,'123','11','2016',"Operation could not be completed:Your card was declined.")
  end

  it 'should raise an error because the exp month is previous than real date' do
    card_number = '4242424242424242'
    on_submit_payment(card_number,'123','11','2014',"Operation could not be completed:Your card's expiration month is invalid.")
  end

  it 'should raise an error because the exp year is previous than real date' do
    card_number = '4242424242424242'
    on_submit_payment(card_number,'123','11','2013',"Operation could not be completed:Your card's expiration year is invalid.")
  end

  it 'should raise an error because the card has expired' do
    expired_card_number = '4000000000000069'
    on_submit_payment(expired_card_number,'123','11','2016',"Operation could not be completed:Your card has expired.")
  end

  it 'should raise an error because the card has expired' do
    card_number = '4000000000000127'
    on_submit_payment(card_number,'123','11','2016',"Operation could not be completed:Your card's security code is incorrect.")
  end

  it 'should complete the transaction' do
    valid_card_number = '4242424242424242'
    on_submit_payment(valid_card_number,'123','11','2016',"Thanks for buy! :)")
  end
end