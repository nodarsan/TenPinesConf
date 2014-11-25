require 'rails_helper'

describe Speaker do
  context 'using all valid speaker data' do
    before(:each) do
      @example_speaker_data = {name: 'Santiago Nodar',
                               mail: 'snodar@10pines.com',
                               phone: '43567823',
                               country: 'argentina',
                               bio: 'Developer, apprentice, etc....' }
    end

    it 'should be valid' do
      newSpeaker = Speaker.new(@example_speaker_data)
      expect(newSpeaker.valid?).to be_truthy
    end
    it 'should save speaker to database' do
      newSpeaker = Speaker.new(@example_speaker_data)
      newSpeaker.save!
      expect(Speaker.find_by_name(@example_speaker_data[:name])).to eq(newSpeaker)
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

  context 'using invalid email' do
    before(:each) do
      @example_speaker_data = {name: 'Santiago Nodar',
                               phone: '43567823',
                               country: 'argentina',
                               bio: 'Developer, apprentice, etc....' }
    end

    it 'should not be valid with email: asdasd' do
      @example_speaker_data[:mail] = 'asdasd'
      newSpeaker = Speaker.new(@example_speaker_data)
      expect(newSpeaker.valid?).to be_falsey
    end
  end
end
