class PostsController < ApplicationController
  expose(:post)
  expose(:posts)

  def index
    respond_with(posts)
  end

  def show
    respond_with(post)
  end
end
