class PostsController < ApplicationController
  expose(:post)
  expose(:posts)

  def index
    respond_with(posts, include: [:comments])
  end

  def show
    respond_with(post)
  end
end
