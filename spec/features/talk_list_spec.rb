require 'rails_helper'

describe 'talk list', :js => true do
  before(:each) do
    @talk = create(:interesting_talk)
    @technology_track = create(:technology_track)
  end

  it 'should show a list of talks' do
    visit '#/talk-list'
    expect(page).to have_content(@talk.title)
  end

  it 'should not show example talk when filter set to Technology' do
    visit '#/talk-list'
    select @technology_track.name
    expect(page).not_to have_content(@talk.title)
  end
end