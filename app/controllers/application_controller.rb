class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include Authentication

  respond_to :json

  protected

  def render_403
    head :forbidden
  end

  def items_per_page
    20
  end

  def render_paginated_collection(collection, meta = {})
    pagination = {
      total_count: collection.total_count,
      per_page: collection.limit_value,
      page: collection.current_page
    }
    meta.merge! pagination

    render json: collection, meta: meta
  end
end
