FactoryBot.define do
  factory :error do
    code { :custom_error }

    trait :with_validations do
      validations do
        { email: ["can't be blank", "is invalid"] }
      end
    end
  end
end
