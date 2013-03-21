class CommentsController < ApplicationController
  expose(:comments)
  expose(:comment)

  def index
    respond_with(comments)
  end

  def show
    respond_with(comment)
  end
end
