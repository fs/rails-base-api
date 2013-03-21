class User::CommentsController < User::BaseController
  expose(:comments, ancestor: :current_user)
  expose(:comment, attributes: :comment_params)

  def index
    respond_with(comments)
  end

  def create
    comment.save

    respond_with(
      comment,
      location: false
    )
  end

  private

  def comment_params
    params.permit(:title, :text)
  end
end
