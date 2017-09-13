module V1
  class PostsController < ApplicationController
    expose :post, id: -> { params[:post_id] }
    expose(:posts, -> { Post.page(params[:page]).per(params[:per_page]).with_comments_and_users })

    def index
      respond_with(posts, serializer: PaginatedArraySerializer)
    end

    def show
      respond_with(post)
    end

    def create
      post.save
      respond_with(post)
    end

    private

    def post_params
      params.require(:post).permit(:title, :text)
    end
  end
end
