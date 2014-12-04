require 'rails_helper'

describe 'Talk List Page', :js => true do

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

  it 'should show the bio when click on + button' do
    visit '#/talk-list'
    expect(page).to_not have_content(@talk.speaker.bio)
    click_link '+'
    expect(page).to have_content(@talk.speaker.bio)
  end

  it 'should only show A funny talk when filter set to Funny' do
    create(:funny_track)
    funny_talk = create(:funny_talk)
    visit '#/talk-list'
    select @talk.talk_track.name
    expect(page).to_not have_content(funny_talk.title)
    expect(page).to have_content(@talk.title)
  end
end