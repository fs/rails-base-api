FactoryGirl.define do
  factory :comment do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph[0..254] }
  end
end
