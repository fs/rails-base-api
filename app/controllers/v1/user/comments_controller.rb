module V1
  module User
    class CommentsController < User::BaseController
      expose(:comments, ancestor: :current_user) do |scope|
        scope.page(params[:page]).per(params[:per_page])
          .with_posts_and_users.ordered
      end
      expose(:comment, attributes: :comment_params)

      def index
        respond_with(comments, serializer: PaginatedArraySerializer)
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
