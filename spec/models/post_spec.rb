require 'spec_helper'

describe Post do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
  end
end
