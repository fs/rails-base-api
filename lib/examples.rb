module Examples
  extend self

  def post
    Post.first
  end

  def setup!
    ActiveRecord::Base.transaction do
      FactoryGirl.create_list :post, 5
    end
  end
end
