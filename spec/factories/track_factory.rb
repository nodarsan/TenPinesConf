FactoryGirl.define do
  factory :agile_track, class: TalkTrack do
    name 'agile'
  end

  factory :technology_track, class: TalkTrack do
    name 'technology'
  end
end