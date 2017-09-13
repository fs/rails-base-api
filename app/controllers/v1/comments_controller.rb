module V1
  class CommentsController < ApplicationController
    expose(:comments) do
      Comment.page(params[:page]).per(params[:per_page])
        .with_posts_and_users.ordered
    end
    expose :comment
    expose :post, id: -> { params[:post_id] }

    def index
      respond_with(comments, serializer: PaginatedArraySerializer)
    end

    def create
      comment.post = post
      comment.user = current_user
      comment.save
      respond_with(comment)
    end

    def update
      comment.update_attributes(comment_params.merge(user_id: current_user.id, post_id: post.id))
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
