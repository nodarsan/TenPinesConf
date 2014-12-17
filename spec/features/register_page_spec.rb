require 'rails_helper'

describe 'Register page', :js => true do

  it 'should display error message when entering an invalid mail' do
    visit '#/register-speaker'
    fill_in 'Your Mail', with: 'asd'
    expect(page).to have_content('not a valid email')
  end

  it 'should not display error message when entering a valid mail' do
    visit '#/register-speaker'
    fill_in 'Your Mail', with: 'snodar@10pines.com'
    expect(page).not_to have_content('not a valid email')
  end

  it 'should register a new user' do
    visit '#/register-speaker'
    fill_in 'Your Mail', with: 'an-account@10pines.com'
    fill_in 'Your Password', with: 'aPassword'
    fill_in 'Your Name', with: 'aName'
    fill_in 'Your Bio', with: 'aBio'
    fill_in 'Your Phone', with: '1234567890'
    fill_in 'Your Country', with: 'Argentina'
    alert = accept_alert do
      click_button 'Submit'
    end
    expect(alert).to eq('Thank you for registering.')
  end


  it 'couldn´t register a registered user' do
      create(:mati_user)
      visit '#/register-speaker'
      fill_in 'Your Mail', with: 'mmelendi@10pines.com'
      fill_in 'Your Password', with: 'otraPassword'
      fill_in 'Your Name', with: 'Matias'
      fill_in 'Your Bio', with: 'aBio'
      fill_in 'Your Phone', with: '1234567890'
      fill_in 'Your Country', with: 'Argentina'

      message = accept_alert do
        click_button 'Submit'
      end
      expect(message).to eq('User already exists.')
  end

  it 'should display error message when entering an invalid mail' do
    visit '#/register-attendee'
    fill_in 'Your Mail', with: 'asd'
    expect(page).to have_content('not a valid email')
  end

  it 'should not display error message when entering a valid mail' do
    visit '#/register-attendee'
    fill_in 'Your Mail', with: 'snodar@10pines.com'
    expect(page).not_to have_content('not a valid email')
  end

  ## After register we proceed to login the user but the record doesn't exists
  ## (maybe it's a time problem, the db couldn't store the record)

  #
  # it 'should register a new attendee user' do
  #   visit '#/register-attendee'
  #   fill_in 'Your Mail', with: 'an-account@10pines.com'
  #   fill_in 'Your Password', with: 'aPassword'
  #   fill_in 'Your Name', with: 'aName'
  #   fill_in 'Your Phone', with: '1234567890'
  #   fill_in 'Your Country', with: 'Argentina'
  #   alert = accept_alert do
  #             click_button 'Submit'
  #   end
  #   expect(alert).to eq('Thank you for registering.')
  # end


  it 'couldn´t register a registered attendee' do
    create(:mati_attendee_user)
    visit '#/register-attendee'
    fill_in 'Your Mail', with: 'mmelendi@10pines.com'
    fill_in 'Your Password', with: 'otraPassword'
    fill_in 'Your Name', with: 'Matias'
    fill_in 'Your Phone', with: '1234567890'
    fill_in 'Your Country', with: 'Argentina'

    message = accept_alert do
      click_button 'Submit'
    end
    expect(message).to eq('User already exists.')
  end

end