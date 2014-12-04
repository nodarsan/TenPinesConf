require 'rails_helper'

describe 'Register Talk Page', :js => true do
  context 'logged in user' do
    before(:each) do
      @speaker = create(:santiago_nodar)
      @user = User.create!(email: 'probando@hotmail.com', password: 'asdasd123', speaker: @speaker)
      create(:half_hour_duration)
      create(:agile_track)
      visit '#/login'
      fill_in 'mail', with: 'probando@hotmail.com'
      fill_in 'pass', with: 'asdasd123'
      click_button 'Submit'
    end

    it 'should show thank you message when submitting' do
      visit '#/talk-proposal'
      fill_in 'Title', with: 'Un titulo'
      fill_in 'Description', with: 'Una descripcion increible...'
      select 'agile', from: 'Track'
      select '30', from: 'duration'
      click_button 'Submit'
      alert = page.driver.browser.switch_to.alert
      expect(alert.text).to eq('Thank you for your proposal.')
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

  context 'not logged in' do
    before(:each) do
      @speaker = create(:santiago_nodar)
      @user = User.create!(email: 'probando@hotmail.com', password: 'asdasd123', speaker: @speaker)
      create(:half_hour_duration)
      create(:agile_track)
    end

    #VER ERROR
    # it 'should not show thank you message when you are not logged in' do
    #   visit '#/talk-proposal'
    #   fill_in 'Title', with: 'Un titulo'
    #   fill_in 'Description', with: 'Una descripcion increible...'
    #   select 'agile', from: 'Track'
    #   select '30', from: 'duration'
    #   click_button 'Submit'
    #   expect{page.driver.browser.switch_to.alert}.to raise_error
    # end
  end



  ## MOVE THIS TEST TO SPEAKER REGISTER
  # it 'should display error message when entering an invalid mail' do
  #   visit '#/talk-proposal'
  #   fill_in 'Mail', with: 'asd'
  #   expect(page).to have_content('not a valid email')
  # end

  # it 'should not display error message when entering a valid mail' do
  #   visit '#/talk-proposal'
  #   fill_in 'Mail', with: 'snodar@10pines.com'
  #   expect(page).not_to have_content('not a valid email')
  # end
end