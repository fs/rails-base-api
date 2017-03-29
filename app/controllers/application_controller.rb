class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include RequestHelper
  include Authentication

  respond_to :json

  def pagination(collection)
    {
      total_count: collection.total_count,
      per_page: collection.limit_value,
      page: collection.current_page
    }
  end
end
