require 'rails_helper'

describe 'Login page' , :js => true do

  before(:each) do
    create(:santi_user)
    create(:mati_user)
    create(:interesting_talk)
  end

  it 'should redirect to login page' do
    visit '#/home'
    click_link 'Login'
    expect(page).to have_content('Person:')
  end

  it 'should contains the title of login page' do
    visit '#/login'
    expect(page).to have_content('Person:')
  end

  it 'should be ok, if santi sign in he could look your proposed talks' do
    visit '#/login'
    fill_in 'mail', with: 'snodar@10pines.com'
    fill_in 'pass' , with: 'unaPassword'
    click_button 'Submit'
    visit '#/talk-list'
    expect(page).to have_content('User: snodar@10pines.com')
    expect(page).to have_content('Un Titulo Muy Interesante')
  end

end