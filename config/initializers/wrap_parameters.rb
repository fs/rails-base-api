# Be sure to restart your server when you modify this file.

# This file contains settings for ActionController::ParamsWrapper which
# is enabled by default.

# Enable parameter wrapping for JSON. You can disable this by setting :format to an empty array.
ActiveSupport.on_load(:action_controller) do
  include ActionController::ParamsWrapper

  # Enable parameter wrapping for JSON
  wrap_parameters(format: [:json, :url_encoded_form])
end
