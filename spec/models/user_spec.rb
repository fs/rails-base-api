require 'rails_helper'

describe User do
  describe 'validations' do
    context 'uniqueness' do
      subject { create :user }
      it { is_expected.to validate_uniqueness_of :email }
    end
  end

  describe 'associations' do
    it { should have_many :comments }
  end
end
