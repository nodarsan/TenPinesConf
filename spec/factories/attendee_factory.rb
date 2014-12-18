FactoryGirl.define do
  factory :santiago_nodar_att, class: Attendee do
    name 'Santiago Nodar'
    phone 45678924
    mail 'snodar@10pines.com'
    country 'Argentina'
  end

  factory :invalid_attendee_user, class: Attendee do
    phone 123456789
    mail 'un_email_invalido@invalido.com'
    country 'Antigua y Barbuda'
  end

  factory :matias_melendi_att, class: Attendee do
    name 'Matias Melendi'
    phone 43435890
    mail 'mmelendi@10pines.com'
    country 'Argentina'
  end
end