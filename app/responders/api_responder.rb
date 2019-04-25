class ApiResponder < ActionController::Responder
  def api_behavior
    if post?
      display resource, status: :created
    else
      display resource, status: :ok
    end
  end
end
