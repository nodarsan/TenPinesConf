require 'rails_helper'

describe 'talk list', :js => true do
  before(:each) do
    duration = TalkDuration.create!(value: 30)
    track = TalkTrack.create!(name: 'agile')
    TalkTrack.create!(name: 'technology')
    speaker = Speaker.create!(name:'Mati Melendi',
                   bio: 'hola hola hola asdasdasd',
                   phone: 432551324,
                   mail: 'matimelendi@10pines.com',
                   country: 'Argentina');
    newTalk = Talk.new
    newTalk.title = 'A Great Talk'
    newTalk.description = 'Many interesting words...'
    newTalk.speaker = speaker
    newTalk.talk_track = track
    newTalk.talk_duration = duration
    newTalk.save!
  end

  it 'should show a list of talks' do
    visit '#/talk-list'
    expect(page).to have_content('A Great Talk')
  end

  it 'should not show example talk when filter set to Technology' do
    visit '#/talk-list'
    select 'technology'
    expect(page).not_to have_content('A Great Talk')
  end


end