require 'spec_helper'

describe User do
  describe 'validations' do
    context 'uniqueness' do
      subject { FactoryGirl.create :user }
      it { should validate_uniqueness_of :email }
    end
  end

  describe 'associations' do
    it { should have_many :comments }
  end

  describe 'callbacks' do
    describe 'before save' do
      it 'calls #ensure_authentication_token!' do
        u = FactoryGirl.build(:user)
        u.should_receive(:ensure_authentication_token!)

        u.save
      end
    end
  end

  describe '#ensure_authentication_token!' do
    let(:user) { described_class.new(authentication_token: token) }
    let(:callback) { ->{ user.ensure_authentication_token! } }

    context 'when token exists' do
      let(:token) { 'token' }

      it 'leaves it as is' do
        expect(callback).not_to change(user, 'authentication_token')
      end
    end

    context 'when token does NOT exist' do
      let(:token) { '' }

      it 'generates new authentication_token' do
        expect(callback).to change(user, 'authentication_token')
      end
    end
  end
end
