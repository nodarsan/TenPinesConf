require 'rails_helper'

describe TalkRegister do
  context 'valid person and talk data' do

    before(:each) do
      talk_duration = TalkDuration.new(value: 30)
      talk_duration.save!
      talk_track = TalkTrack.new(name: 'agile')
      talk_track.save!
      @EXAMPLE_SPEAKER_DATA = {name: 'Santiago Nodar',
                              mail: 'snodar@10pines.com',
                              phone: '43567823',
                              country: 'argentina',
                              bio: 'Developer, apprentice, etc...' }
      @EXAMPLE_TALK_DATA = {title: 'Some title',
                           description: 'Some interesting topic...',
                           duration: talk_duration.value,
                           track: talk_track.name}
      ActionMailer::Base.deliveries = []
    end

    it 'should create new person a save it to the DB' do
      talkRegister = TalkRegister.new
      newTalk = talkRegister.register_new_talk(@EXAMPLE_SPEAKER_DATA, @EXAMPLE_TALK_DATA)

      expect(Talk.find_by_title(@EXAMPLE_TALK_DATA[:title])).to eq(newTalk)
    end

    it 'should send 2 mails' do
      talkRegister = TalkRegister.new
      talkRegister.register_new_talk(@EXAMPLE_SPEAKER_DATA, @EXAMPLE_TALK_DATA)
      expect(ActionMailer::Base.deliveries.size).to eq(2)
    end
  end

end