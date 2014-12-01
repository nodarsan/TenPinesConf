FactoryGirl.define do
  factory :interesting_talk, class: Talk do
    title 'Un Titulo Muy Interesante'
    description 'Una descripcion cautivante, que convenza a la gente a ver la charla.'
    talk_duration {create(:half_hour_duration)}
    talk_track {create(:agile_track)}
    speaker {create(:santiago_nodar)}
  end

  factory :funny_talk, class: Talk do
    title 'A Funny Talk'
    description 'Many funny words'
    talk_duration {create(:half_hour_duration)}
    talk_track {create(:funny_track)}
    speaker {create(:matias_melendi)}
  end

end