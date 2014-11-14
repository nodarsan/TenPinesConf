require 'rails_helper'

describe SpeakerMailer do
  
  before(:each) do
    @example_speaker_data = {name: 'Santiago Nodar',
                             mail: 'snodar@10pines.com',
                             phone: '43567823',
                             country: 'argentina',
                             bio: 'Developer, apprentice, etc...' }
    @example_talk_data = {title: 'Some title',
                          description: 'Some interesting topic...'}
    talk_duration = TalkDuration.new(value: 30)
    talk_track = TalkTrack.new(name: 'agile')
    speaker = Speaker.new(@example_speaker_data)
    talk = Talk.new(@example_talk_data)
    talk.speaker = speaker
    talk.talk_duration = talk_duration
    talk.talk_track = talk_track
    ActionMailer::Base.deliveries = []
    @mail = SpeakerMailer.thank_you_mail(talk)
  end

  it 'should be sent' do
    @mail.deliver
    expect(ActionMailer::Base.deliveries.empty?).to be_falsey
  end

  it 'should ' do
    expect(@mail.to).to eq([@example_speaker_data[:mail]])
    expect(@mail.from).to eq(['notification@tenpinesconf.com'])
    expect(@mail.subject).to eq('10PinesConf - Gracias')
  end
end
