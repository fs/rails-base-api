FactoryGirl.define do
  factory :comment do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
  end
end
