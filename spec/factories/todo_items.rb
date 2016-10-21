FactoryGirl.define do
  factory :todo_item do
    user
    title { Faker::Hipster.word }
    text { Faker::Hipster.paragraph }
  end
end
