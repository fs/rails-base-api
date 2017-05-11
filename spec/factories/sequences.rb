FactoryGirl.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:password) { "123456" }
end
