class PostSerializer < BaseSerializer
  attributes :id, :title, :text

  has_many :comments

  def comments
    object.comments.includes(:user)
  end
end
