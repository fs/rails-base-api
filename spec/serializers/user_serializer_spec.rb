require 'rails_helper'

describe UserSerializer do
  let(:user) { build :user, id: 1, authentication_token: 'token' }
  let(:json) { UserSerializer.new(user).to_json }
  let(:user_json) { parse_json(json) }

  it 'returns user' do
    expect(user_json).to be_a_user_representation(user)
  end
end
