require 'rails_helper'

describe 'My talks list for current user', :js => true do

  before(:each) do
    create(:mati_user)
    create(:interesting_talk)

    visit '#/login'
    fill_in 'mail', with: 'mmelendi@10pines.com'
    fill_in 'pass' , with: 'otraPassword'
    click_button 'Submit'
  end

  # # CurrentUser doesn't exists
  # it 'should show only talks for Melendi' do
  #   create(:funny_talk)
  #   visit '#/my-talks'
  #   expect(page).to have_content('A Funny Talk')
  #   expect(page).to_not have_content('Un Titulo Muy Interesante')
  # end

end