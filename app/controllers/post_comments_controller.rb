class PostCommentsController < ApplicationController
  expose(:post)
  expose(:comments, ancestor: :post)

  def index
    respond_with(comments)
  end
end
