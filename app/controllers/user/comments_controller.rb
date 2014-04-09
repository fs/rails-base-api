class User
  class CommentsController < User::BaseController
    expose(:comments, ancestor: :current_user) { |scope| scope.with_posts_and_users }
    expose(:comment, attributes: :comment_params)

    def index
      respond_with(
        comments,
        serializer_includes: {
          comment: %i[post user]
        }
      )
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
      params.require(:comment).permit(:title, :text)
    end
  end
end
