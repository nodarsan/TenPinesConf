require 'rails_helper'

describe TalkDuration do
  context 'Using valid duration value' do
    EXAMPLE_DURATION = 30

    it 'should be valid with value 30' do
      newDuration = TalkDuration.new(value: EXAMPLE_DURATION)
      expect(newDuration.valid?).to be_truthy
    end

    it 'should save new duration to DB' do
      newDuration = TalkDuration.new(value: EXAMPLE_DURATION)
      newDuration.save!

      expect(TalkDuration.find_by_value(EXAMPLE_DURATION)).to eq(newDuration)
    end
  end

  context 'Using no duration value' do
    it 'should not be valid without a value' do
      newDuration = TalkDuration.new()
      expect(newDuration.valid?).to be_falsey
    end
    it 'should not save invalid duration to DB' do
      numberOfDurations = TalkDuration.all.size
      newDuration = TalkDuration.new()

      expect{newDuration.save!}.to raise_error ActiveRecord::RecordInvalid
      expect(TalkDuration.all.size).to eq(numberOfDurations)
    end
  end
end
