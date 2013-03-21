ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)
end

ActiveSupport.on_load(:action_controller) do
  ActionController::API.send :include, ActionController::StrongParameters
end
