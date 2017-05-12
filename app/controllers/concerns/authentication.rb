module Authentication
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :render_403
  end

  def render_403
    raise NotImplementedError
  end
end
