# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username
    password

    trait :admin do
      role User.roles[:admin]
    end
  end
end
