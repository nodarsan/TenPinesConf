FactoryGirl.define do

  factory :santi_attendee_user, class: AttendeeUser do
    email 'snodar@10pines.com'
    password 'unaPassword'
    attendee {create(:santiago_nodar_att)}
  end

  factory :mati_attendee_user, class: AttendeeUser do
    email 'mmelendi@10pines.com'
    password 'otraPassword'
    attendee {create(:matias_melendi_att)}
  end

end
