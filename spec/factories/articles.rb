# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title { generate(:article_title) }
    content { generate(:article_content) }
  end
end
