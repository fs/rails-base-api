class CommentsController < ApplicationController
  expose(:comment)
  expose(:comments)

  def index
    respond_with(comments, include: [:post])
  end

  def show
    respond_with(comment)
  end
end
