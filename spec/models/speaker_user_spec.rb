require 'rails_helper'

describe SpeakerUser do
   context 'using all valid speaker data' do
    before(:each) do
      @mail = 'snodar@10pines.com'
      @password = 'asd'
      @example_speaker_data = {name: 'Santiago Nodar',
                               mail: @mail,
                               phone: '43567823',
                               country: 'argentina',
                               bio: 'Developer, apprentice, etc....' }
    end

    it 'should be valid' do
      speaker = Speaker.new(@example_speaker_data)
      user = SpeakerUser.new(email: @mail, password: @password, speaker: speaker)
      expect(user.valid?).to be_truthy
    end

    it 'should be able to authorize  with correct data after being created' do
      speaker = Speaker.new(@example_speaker_data)
      user = SpeakerUser.create!(email: @mail, password: @password, speaker: speaker)
      authenticated_user = SpeakerUser.find_by_email(@mail)
      expect(authenticated_user).to eq(user)
      expect(authenticated_user.valid_password?(@password)).to be_truthy
    end

    it 'should not be able to authorize with incorrect mail' do
      speaker = Speaker.new(@example_speaker_data)
      SpeakerUser.create!(email: @mail, password: @password, speaker: speaker)
      expect{SpeakerUser.find_by_email!('algo@gmail.com')}.to raise_error
    end

    it 'should not be able to authorize with incorrect password' do
      speaker = Speaker.new(@example_speaker_data)
      user = SpeakerUser.create!(email: @mail, password: @password, speaker: speaker)
      authenticated_user = SpeakerUser.find_by_email(@mail)
      expect(authenticated_user).to eq(user)
      expect(authenticated_user.valid_password?('123')).to be_falsey
    end
  end

  context 'using non valid speaker data' do
    before(:each) do
      @mail = 'snodar@10pines.com'
      @password = 'asd'
      @example_speaker_data = {
          mail: @mail,
          phone: '43567823',
          country: 'argentina',
          bio: 'Developer, apprentice, etc....' }
    end

    it 'should be valid' do
      speaker = Speaker.new(@example_speaker_data)
      user = SpeakerUser.new(email: @mail, password: @password, speaker: speaker)
      expect(user.valid?).to be_falsey
    end

    it 'should be able to authorize after being created' do
      speaker = Speaker.new(@example_speaker_data)
      expect{SpeakerUser.create!(email: @mail, password: @password, speaker: speaker)}.to raise_error
    end
  end
end
