require 'rails_helper'

describe 'My talks list for current user', :js => true do

  before(:each) do
    create(:mati_user)
    create(:interesting_talk)

    visit '#/login-speaker'
    fill_in 'email', with: 'mmelendi@10pines.com'
    fill_in 'pass' , with: 'otraPassword'
    click_button 'Submit'
    sleep(1)
    visit '#/talk-proposal'
    fill_in 'Title', with: 'A Funny Talk'
    fill_in 'Description', with: 'Una descripcion increible...'
    select 'agile', from: 'Track'
    select '30', from: 'duration'
    accept_alert do
      click_button 'Submit'
      sleep(1)
    end
  end

  # CurrentUser doesn't exists
  it 'should show only talks for Melendi' do
    expect(page).to have_content('A Funny Talk')
    expect(page).to_not have_content('Un Titulo Muy Interesante')
  end

end