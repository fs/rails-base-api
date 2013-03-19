require 'spec_helper'

describe UserSerializer do
  let(:user) { FactoryGirl.build :user, id: 1, authentication_token: 'token' }
  let(:json) { UserSerializer.new(user).to_json }

  subject { JSON.parse(json) }

  it { should be_a_user_representation(user) }
end
