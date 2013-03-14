class PostCommentsController < ApplicationController
  expose(:post)
  expose(:comments, ancestor: :post)

  def index
    respond_with(comments, root: :comments)
  end
end
