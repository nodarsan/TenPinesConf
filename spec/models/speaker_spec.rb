require 'rails_helper'

describe Speaker do
  context 'using all valid speaker data' do
    EXAMPLE_SPEAKER_DATA = {name: 'Santiago Nodar',
                       mail: 'snodar@10pines.com',
                       phone: '43567823',
                       country: 'argentina',
                       bio: 'Developer, apprentice, etc....' }
    it 'should be valid' do
      newSpeaker = Speaker.new(EXAMPLE_SPEAKER_DATA)
      expect(newSpeaker.valid?).to be_truthy
    end
    it 'should save speaker to database' do
      newSpeaker = Speaker.new(EXAMPLE_SPEAKER_DATA)
      newSpeaker.save!
      expect(Speaker.find_by_name(EXAMPLE_SPEAKER_DATA[:name])).to eq(newSpeaker)
    end
  end

  context 'using no data' do
    it 'should not be valid without any data' do
      newSpeaker = Speaker.new()
      expect(newSpeaker.valid?).to be_falsey
    end
    it 'should save speaker to database' do
      numberOfRegisteredSpeakers = Speaker.all.size
      newSpeaker = Speaker.new()
      expect{newSpeaker.save!}.to raise_error
      expect(Speaker.all.size).to eq(numberOfRegisteredSpeakers)
    end
  end
end
