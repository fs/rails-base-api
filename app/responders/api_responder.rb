class ApiResponder < ActionController::Responder
  def api_behavior(error)
    fail(error) unless resourceful?

    if get?
      display resource
    else
      status = post? ? :created : :ok
      display(resource, status: status, location: api_location)
    end
  end
end
