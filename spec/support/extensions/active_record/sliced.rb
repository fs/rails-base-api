ActiveRecord::Base.class_eval do
  def sliced_attributes(keys)
    attributes.slice(*keys)
  end
end
