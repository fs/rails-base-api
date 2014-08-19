module V1
  module User
    class CommentsController < V1::User::BaseController
      expose(:comments, ancestor: :current_user) { |scope| scope.with_posts_and_users }
      expose(:comment, attributes: :comment_params)

      def index
        respond_with(
          comments,
          serializer_includes: {
            comment: %i(post user)
          }
        )
      end

      def create
        comment.save

        respond_with(comment)
      end

      def update
        comment.save

        respond_with(comment)
      end

      def destroy
        comment.destroy

        respond_with(comment)
      end

      private

      def comment_params
        params.require(:comment).permit(:title, :text)
      end
    end
  end
end
