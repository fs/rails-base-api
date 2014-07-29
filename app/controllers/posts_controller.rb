class PostsController < ApplicationController
  expose(:post)
  expose(:posts) { |scope| scope.with_comments_and_users }

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
