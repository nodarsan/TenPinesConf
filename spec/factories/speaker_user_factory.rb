FactoryGirl.define do
  factory :santi_user, class: SpeakerUser do
    email 'snodar@10pines.com'
    password 'unaPassword'
    speaker {create(:santiago_nodar)}
  end

  factory :mati_user, class: SpeakerUser do
    email 'mmelendi@10pines.com'
    password 'otraPassword'
    speaker {create(:matias_melendi)}
  end
end
