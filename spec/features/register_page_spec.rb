require 'rails_helper'

describe 'Register page', :js => true do

  it 'should display error message when entering an invalid mail' do
    visit '#/register'
    fill_in 'Your Mail', with: 'asd'
    expect(page).to have_content('not a valid email')
  end

  it 'should not display error message when entering a valid mail' do
    visit '#/register'
    fill_in 'Your Mail', with: 'snodar@10pines.com'
    expect(page).not_to have_content('not a valid email')
  end

end