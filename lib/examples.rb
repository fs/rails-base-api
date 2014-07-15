module Examples
  module_function

  def user
    User.first
  end

  def password
    '123456'
  end

  def setup!
    ActiveRecord::Base.transaction do
      FactoryGirl.create :user
    end
  end
end
