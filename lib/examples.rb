module Examples
  extend self

  def post
    Post.first
  end

  def comment
    post.comments.first
  end

  def setup!
    ActiveRecord::Base.transaction do
      FactoryGirl.create_list :post, 5
      FactoryGirl.create_list :comment, 2, post: post
    end
  end
end
