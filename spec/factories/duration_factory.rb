FactoryGirl.define do
  factory :half_hour_duration, class: TalkDuration do
    value 30
  end

  factory :full_hour_duration, class: TalkDuration do
    value 60
  end
end