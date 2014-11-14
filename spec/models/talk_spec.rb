require 'rails_helper'

describe Talk do
  context 'valid data and existing person' do

    before(:each) do
      @example_speaker_data = {name: 'Santiago Nodar',
                               mail: 'snodar@10pines.com',
                               phone: '43567823',
                               country: 'argentina',
                               bio: 'Developer, apprentice, etc...' }
      @example_talk_data = {title: 'Some title',
                            description: 'Some interesting topic...'}
      talk_duration = TalkDuration.new(value: 30)
      talk_duration.save!
      talk_track = TalkTrack.new(name: 'agile')
      talk_track.save!
      speaker = Speaker.new(@example_speaker_data)
      speaker.save!
      @talk = Talk.new(@example_talk_data)
      @talk.speaker = speaker
      @talk.talk_duration = talk_duration
      @talk.talk_track = talk_track
    end

    it 'should be valid' do
      expect(@talk.valid?).to be_truthy
    end
    it 'should save talk to db' do
      expect{@talk.save!}.not_to raise_error
      expect(Talk.find_by_title(@example_talk_data[:title])).to eq(@talk)
    end
  end

  context 'non existent person, duration or track' do

    before(:each) do
      @example_talk_data = {title: 'Some title',
                            description: 'Some interesting topic...',
                            speaker_id: 1,
                            talk_duration_id: 1,
                            talk_track_id: 1}
      @talk = Talk.new(@example_talk_data)
    end

    it 'should be valid' do
      expect(@talk.valid?).to be_falsey
    end
    it 'should save talk to db' do
      numberOfRegisterdTalks = Talk.all.size
      expect{@talk.save!}.to raise_error
      expect(Talk.all.size).to eq(numberOfRegisterdTalks)
    end
  end
end
