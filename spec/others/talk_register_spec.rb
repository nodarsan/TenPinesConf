require 'rails_helper'

describe TalkRegister do
  context 'valid person and talk data' do
    before(:each) do
      talk_duration = create(:half_hour_duration)
      talk_track = create(:agile_track)
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

    it 'should create new talk a save it to the DB' do
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

  context 'missing person name in data' do
    before(:each) do
      talk_duration = create(:half_hour_duration)
      talk_track = create(:agile_track)
      @EXAMPLE_SPEAKER_DATA = {mail: 'snodar@10pines.com',
                               phone: '43567823',
                               country: 'argentina',
                               bio: 'Developer, apprentice, etc...'}
      @EXAMPLE_TALK_DATA = {title: 'Some title',
                            description: 'Some interesting topic...',
                            duration: talk_duration.value,
                            track: talk_track.name}
      ActionMailer::Base.deliveries = []
    end

    it 'should not save the talk in the database' do
      talkRegister = TalkRegister.new

      expect{talkRegister.register_new_talk(@EXAMPLE_SPEAKER_DATA, @EXAMPLE_TALK_DATA)}.to raise_error

      expect(Talk.find_by_title(@EXAMPLE_TALK_DATA[:title])).to eq(nil)
    end

    it 'should not send mails if the proposed talk data was invalid' do
      talkRegister = TalkRegister.new

      expect{talkRegister.register_new_talk(@EXAMPLE_SPEAKER_DATA, @EXAMPLE_TALK_DATA)}.to raise_error

      expect(ActionMailer::Base.deliveries.size).to eq(0)
    end
  end
end