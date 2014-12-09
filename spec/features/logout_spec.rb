require 'rails_helper'

describe 'Logout', :js => true do

  before(:each) do
    create(:mati_user)
    visit '#/login'
    fill_in 'mail', with: 'mmelendi@10pines.com'
    fill_in 'pass' , with: 'otraPassword'
    click_button 'Submit'
  end

  it 'shouldn´t show the current user' do
    expect(page).to have_content('USER: MMELENDI@10PINES.COM')
    click_link 'Log out'
    alert = page.driver.browser.switch_to.alert
    expect(alert.text).to eq('Bye bye! :)')

    expect(page).to_not have_content('USER: MMELENDI@10PINES.COM')
  end

  it 'shouldn´t show section my talks' do
    expect(page).to have_content('MY TALKS')
    click_link 'Log out'
    expect(page).to_not have_content('MY TALKS')
  end

  it 'should show login and sign up links' do
    click_link 'Log out'
    expect(page).to have_content('SIGN UP')
    expect(page).to have_content('LOGIN')
  end

end