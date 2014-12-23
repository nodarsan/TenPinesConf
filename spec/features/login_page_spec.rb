require 'rails_helper'

describe 'Login page' , :js => true do

  before(:each) do
    create(:santi_user)
    create(:mati_user)
    create(:mati_attendee_user)
    create(:interesting_talk)
  end

  def when_forgot_my_password_expect(page, email, msg)
    visit page
    click_link 'Forgot your password?'
    fill_in 'email', with: email
    message = accept_alert do
      click_button 'Submit'
      sleep 1
    end
    expect(message).to eq(msg)
  end

  it 'should redirect to login home page' do
    visit '#/home'
    click_link 'Login'
    expect(page).to have_content('Login as speaker')
    expect(page).to have_content('Login as attendee')
  end

  it 'should contains the title of speaker login page' do
    visit '#/login-speaker'
    expect(page).to have_content('Login as speaker:')
  end

  it 'should contains the title of attendee login page' do
    visit '#/login-attendee'
    expect(page).to have_content('Login as attendee:')
  end

  it 'should be ok, if santi sign in he could look your proposed talks' do
    visit '#/login-speaker'
    fill_in 'mail', with: 'snodar@10pines.com'
    fill_in 'pass' , with: 'unaPassword'
    click_button 'Submit'
    sleep(1)
    expect(page.text.upcase).to have_content('USER: SNODAR@10PINES.COM')
    expect(page.text.upcase).to have_content('PROPOSE A TALK')
  end

  it 'should be ok, if mati sign in he could by tickets for the conference' do
    visit '#/login-attendee'
    fill_in 'mail', with: 'mmelendi@10pines.com'
    fill_in 'pass' , with: 'otraPassword'
    click_button 'Submit'
    sleep(1)
    expect(page.text.upcase).to have_content('USER: MMELENDI@10PINES.COM')
    expect(page.text.upcase).to have_content('BUY TICKET')
  end

  it 'should send an email with a temporary password to speaker user´s account' do
    when_forgot_my_password_expect('#/login-speaker', 'snodar@10pines.com', 'Your new password has been sent to your email account!')
  end

  it 'should send an email with a temporary password to attendee user´s account' do
    when_forgot_my_password_expect('#/login-attendee', 'mmelendi@10pines.com', 'Your new password has been sent to your email account!')
  end

  it 'should raise an error message because the user is not register' do
    when_forgot_my_password_expect('#/login-attendee', 'false-email@falsey.com',
                                   'An error occurred, check the email has correctly written and retry')
  end

  it 'should raise an error message because the user is not register' do
    when_forgot_my_password_expect('#/login-speaker', 'false-email@falsey.com',
                                   'An error occurred, check the email has correctly written and retry')
  end

end