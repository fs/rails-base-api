class ApplicationSerializer < ActiveModel::Serializer
  def initialize(object, options = {})
    options[:root] = "data"
    super(object, options)
  end
end
