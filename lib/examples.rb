module Examples
  module_function

  def post
    Post.first
  end

  def comment
    post.comments.first
  end

  def user
    User.first
  end

  def password
    '123456'
  end

  def setup!
    ActiveRecord::Base.transaction do
      FactoryGirl.create :user
      FactoryGirl.create_list :post, 5
      FactoryGirl.create_list :comment, 2, post: post, user: user
    end
  end
end
