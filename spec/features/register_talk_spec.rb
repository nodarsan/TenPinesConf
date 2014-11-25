require 'rails_helper'

describe 'Register Talk Page', :js => true do

  before(:each) do
    TalkDuration.new(value: 30).save!
    TalkTrack.new(name: 'agile').save!
  end

  it 'should display error message when entering an invalid mail' do
    visit '#/talk-proposal'
    fill_in 'Mail', with: 'asd'
    expect(page).to have_content('not a valid email')
  end

  it 'should not display error message when entering a valid mail' do
    visit '#/talk-proposal'
    fill_in 'Mail', with: 'snodar@10pines.com'
    expect(page).not_to have_content('not a valid email')
  end

  it 'should show alert message' do
    visit '#/talk-proposal'
    fill_in 'Name', with: 'Santiago Nodar'
    fill_in 'Mail', with: 'snodar@10pines.com'
    fill_in 'Phone', with: '43567121'
    fill_in 'Country', with: 'Argentina'
    fill_in 'Bio', with: 'Algo algo algo...'
    fill_in 'Title', with: 'Un titulo'
    fill_in 'Description', with: 'Una descripcion increible...'
    select 'agile', from: 'Track'
    select '30', from: 'duration'
    click_button 'Submit'
    alert = page.driver.browser.switch_to.alert
    expect(alert.text).to eq('Thank you for your proposal.')
  end
end