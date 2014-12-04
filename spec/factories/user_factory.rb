FactoryGirl.define do
  factory :santi_user, class: User do
      email 'snodar@10pines.com'
      password 'unaPassword'
      speaker_id {create(:santiago_nodar).id}
  end

  factory :mati_user, class: User do
    email 'mmelendi@10pines.com'
    password 'otraPassword'
    speaker_id {create(:matias_melendi).id}
  end

end