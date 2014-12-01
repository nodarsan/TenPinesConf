FactoryGirl.define do
  factory :interesting_talk, class: Talk do
    title 'Un Titulo Muy Interesante'
    description 'Una descripcion cautivante, que convenza a la gente a ver la charla.'
    talk_duration {create(:half_hour_duration)}
    talk_track {create(:agile_track)}
    speaker {create(:santiago_nodar)}
  end
end