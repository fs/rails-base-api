class Api::V1::ArticlesController < ApplicationController
  expose(:articles) { Article.all }

  def index
    render json: articles
  end
end
