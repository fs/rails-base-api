class PostsController < ApplicationController
  expose(:posts) { Post.all }

  def index
    respond_with(posts)
  end
end
