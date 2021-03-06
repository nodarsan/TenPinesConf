require 'rails_helper'

describe 'Register Talk Page', :js => true do
  context 'logged in user' do
    before(:each) do
      create(:santi_user)
      create(:half_hour_duration)
      create(:agile_track)

      visit '#/login-speaker'
      fill_in 'mail', with: 'snodar@10pines.com'
      fill_in 'pass', with: 'unaPassword'
      click_button 'Submit'
      sleep(1)
    end

    it 'should show thank you message when submitting' do
      visit '#/talk-proposal'
      fill_in 'Title', with: 'Un titulo'
      fill_in 'Description', with: 'Una descripcion increible...'
      select 'agile', from: 'Track'
      select '30', from: 'duration'
      message = accept_alert do
        click_button 'Submit'
      end
      expect(message).to eq('Thank you for your proposal.')
    end

    it 'should not show thank you message when there are fields missing.' do
      visit '#/talk-proposal'
      fill_in 'Description', with: 'Una descripcion increible...'
      select 'agile', from: 'Track'
      select '30', from: 'duration'
      click_button 'Submit'
      expect{page.driver.browser.switch_to.alert}.to raise_error
    end
  end


end