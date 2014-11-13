require 'rails_helper'

describe TalkTrack do
  context 'Using valid name' do
    EXAMPLE_TRACK = 'agile'

    it 'should be valid' do
      newTrack = TalkTrack.new(name: EXAMPLE_TRACK)
      expect(newTrack.valid?).to be_truthy
    end

    it 'should save new track to DB' do
      newTrack = TalkTrack.new(name: EXAMPLE_TRACK)

      expect(newTrack.save).to be_truthy
      expect(TalkTrack.find_by_name(EXAMPLE_TRACK)).to eq(newTrack)
    end
  end

  context 'Using no name' do
    it 'should not be valid without a name' do
      newTrack = TalkTrack.new
      expect(newTrack.valid?).to be_falsey
    end
    it 'should not save invalid track to DB' do
      numberOfTracks= TalkTrack.all.size
      newTrack = TalkTrack.new

      expect(newTrack.save).to be_falsey
      expect(TalkTrack.all.size).to eq(numberOfTracks)
    end
  end
end