module Api
  module V1
    class PostsController < ApplicationController
      expose(:post)
      expose(:posts)

      def index
        respond_with(
          posts,
          serializer_includes: {
            post: [:comments],
            comment: [:user]
          }
        )
      end

      def show
        respond_with(post)
      end
    end
  end
end
