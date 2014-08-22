module V1
  module User
    class CommentsController < User::BaseController
      expose(:comments, ancestor: :current_user) do |scope|
        scope.page(params[:page]).per(params[:per_page]).with_posts_and_users
      end
      expose(:comment, attributes: :comment_params)

      def index
        respond_with(
          comments,
          serializer_includes: {
            comment: %i(post user)
          },
          serializer: PaginatedArraySerializer
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
end
