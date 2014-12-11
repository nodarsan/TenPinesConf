require 'rails_helper'

describe 'User' do
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
      user = User.new(email: @mail, password: @password, speaker: speaker)
      expect(user.valid?).to be_truthy
    end

    it 'should be able to authorize  with correct data after being created' do
      speaker = Speaker.new(@example_speaker_data)
      user = User.create!(email: @mail, password: @password, speaker: speaker)
      authenticated_user = User.authenticate(@mail, @password)
      expect(authenticated_user).to eq(user)
    end

    it 'should not be able to authorize with incorrect data' do
      speaker = Speaker.new(@example_speaker_data)
      user = User.create!(email: @mail, password: @password, speaker: speaker)
      authenticated_user = User.authenticate('algo@gmail.com', 'asd')
      expect(authenticated_user).not_to eq(user)
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
      user = User.new(email: @mail, password: @password, speaker: speaker)
      expect(user.valid?).to be_falsey
    end

    it 'should be able to authorize after being created' do
      speaker = Speaker.new(@example_speaker_data)
      expect{User.create!(email: @mail, password: @password, speaker: speaker)}.to raise_error
    end
  end
end