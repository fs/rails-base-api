module V1
  class PostsController < ApplicationController
    expose(:post)
    expose(:posts) do |scope|
      scope.page(params[:page]).per(params[:per_page]).with_comments_and_users
    end

    def index
      respond_with(posts, serializer: PaginatedArraySerializer)
    end

    def show
      respond_with(post)
    end
  end
end
