ActiveSupport.on_load(:active_model_serializers) do
  self.root = false
  ActiveModel::ArraySerializer.root = false
end
