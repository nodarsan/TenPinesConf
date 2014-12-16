require 'rails_helper'

describe 'Login page' , :js => true do

  before(:each) do
    create(:santi_user)
    create(:mati_user)
    create(:interesting_talk)
  end

  it 'should redirect to login home page' do
    visit '#/home'
    click_link 'Login'
    expect(page).to have_content('Login as speaker')
    expect(page).to have_content('Login as attendee')
  end

  it 'should contains the title of login page' do
    visit '#/login-speaker'
    expect(page).to have_content('Login as speaker:')
  end

  it 'should be ok, if santi sign in he could look your proposed talks' do
    visit '#/login-speaker'
    fill_in 'mail', with: 'snodar@10pines.com'
    fill_in 'pass' , with: 'unaPassword'
    click_button 'Submit'
    sleep(1)
    expect(page.text.upcase).to have_content('USER: SNODAR@10PINES.COM')
  end

end