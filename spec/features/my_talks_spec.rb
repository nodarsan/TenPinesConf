require 'rails_helper'

describe 'My talks list for current user', :js => true do

  before(:each) do
    create(:mati_user)
    create(:interesting_talk)

    visit '#/login'
    fill_in 'mail', with: 'mmelendi@10pines.com'
    fill_in 'pass' , with: 'otraPassword'
    click_button 'Submit'
    visit '#/talk-proposal'
    fill_in 'Title', with: 'A Funny Talk'
    fill_in 'Description', with: 'Una descripcion increible...'
    select 'agile', from: 'Track'
    select '30', from: 'duration'
    message = accept_alert do
      click_button 'Submit'
    end
  end

  # CurrentUser doesn't exists
  it 'should show only talks for Melendi' do
    expect(page).to have_content('A Funny Talk')
    expect(page).to_not have_content('Un Titulo Muy Interesante')
  end

end