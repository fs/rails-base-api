class ApiResponder < ActionController::Responder
  def api_behavior(error)
    fail(error) unless resourceful?

    if get?
      display(resource)
    elsif post?
      display(resource, status: :created, location: options[:location])
    else
      display(resource, status: :ok, location: options[:location])
    end
  end
end
