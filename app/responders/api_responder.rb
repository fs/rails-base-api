class ApiResponder < ActionController::Responder
  def api_behavior(error)
    fail(error) unless resourceful?

    if get?
      display resource
    elsif post?
      display resource, status: :created, location: nil
    else
      head :no_content
    end
  end

  def respond
    options[:meta] = pagination_info if paginated?
    super
  end

  private

  def pagination_info
    {
      total: resource.total_count,
      per_page: resource.limit_value,
      page: resource.current_page
    }
  end

  def paginated?
    resource.respond_to?(:total_count) &&
      resource.respond_to?(:limit_value) &&
      resource.respond_to?(:current_page)
  end
end
