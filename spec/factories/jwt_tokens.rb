FactoryBot.define do
  factory :jwt_token do
    transient do
      subject { create :user }

      id { subject.id }
    end

    payload { { "sub" => id } }

    initialize_with { new(payload: payload) }
  end
end
