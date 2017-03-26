FactoryGirl.define do
  sequence(:username) { |n| "user#{n}" }
  sequence(:password) { "123456" }
  sequence(:article_title) { Faker::Lorem.sentence }
  sequence(:article_content) { Faker::Lorem.paragraph }
end
