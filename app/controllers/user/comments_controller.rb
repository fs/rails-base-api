class User::CommentsController < User::BaseController
  expose(:comments, ancestor: :current_user)

  def index
    respond_with(comments)
  end
end
