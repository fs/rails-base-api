class ApiResponder < ActionController::Responder
  def api_behavior(error)
    fail(error) unless resourceful?

    if get?
      display resource
    elsif post?
      display_resource(status: :created)
    else
      display_resource(status: :ok)
    end
  end

  private

  def display_resource(status:)
    display(
      resource,
      status: status,
      location: options[:location]
    )
  end
end
