FactoryGirl.define do
  factory :ticket_sale do
    stripe_id "MyString"
card_name "MyString"
billing_address "MyString"
price 1
last4 1
attendee nil
  end

end
