require 'rails_helper'

describe OrganizerMailer do
  EXAMPLE_SPEAKER_DATA = {name: 'Santiago Nodar',
                          mail: 'snodar@10pines.com',
                          phone: '43567823',
                          country: 'argentina',
                          bio: 'Developer, apprentice, etc...' }
  EXAMPLE_TALK_DATA = {title: 'Some title',
                       description: 'Some interesting topic...'}
  before(:each) do
    talk_duration = TalkDuration.new(value: 30)
    talk_track = TalkTrack.new(name: 'agile')
    speaker = Speaker.new(EXAMPLE_SPEAKER_DATA)
    talk = Talk.new(EXAMPLE_TALK_DATA)
    talk.speaker = speaker
    talk.talk_duration = talk_duration
    talk.talk_track = talk_track
    ActionMailer::Base.deliveries = []
    @mail = OrganizerMailer.new_talk_mail(talk)
  end
  it 'should be sent' do
    @mail.deliver
    expect(ActionMailer::Base.deliveries.empty?).to be_falsey
  end
  it 'should ' do
    expect(@mail.to).to eq(['organizer@tenpinesconf.com'])
    expect(@mail.from).to eq(['notification@tenpinesconf.com'])
    expect(@mail.subject).to eq('New Talk Proposal')
  end
end
