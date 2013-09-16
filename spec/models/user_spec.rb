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
    context 'when token exists' do
      it 'leaves it as is' do
        user = described_class.new(authentication_token: 'foo')
        expect {
          user.ensure_authentication_token!
        }.not_to change(user, 'authentication_token')
      end
    end

    context 'when token does NOT exist' do
      it 'generates new authentication_token' do
        user = described_class.new(authentication_token: '')

        expect {
          user.ensure_authentication_token!
        }.to change(user, 'authentication_token')
      end
    end
  end
end
