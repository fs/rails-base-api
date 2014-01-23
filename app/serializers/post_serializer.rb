class PostSerializer < BaseSerializer
  attributes :id, :title, :text

  has_many :comments

  def comments
    Comment.includes(:user)
  end
end
