FactoryGirl.define do
  factory :santiago_nodar, class: Speaker do
    name 'Santiago Nodar'
    bio 'Esta es una corta biografia que describe de manera interesante la experiencia y conocimientos del speaker.'
    phone 45678924
    mail 'snodar@10pines.com'
    country 'Argentina'
  end

  factory :matias_melendi, class: Speaker do
    name 'Matias Melendi'
    bio 'Otra corta biografia que describe de manera interesante la experiencia y conocimientos del speaker.'
    phone 43435890
    mail 'mmelendi@10pines.com'
    country 'Argentina'
  end
end