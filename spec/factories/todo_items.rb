FactoryGirl.define do
  factory :todo_item do
    user
    title { Faker::Hipster.word }
    text { Faker::Hipster.paragraph }
    status 0
  end
end
