class PaginatedArraySerializer < ActiveModel::Serializer::ArraySerializer
  def initialize(objects, options = {})
    options[:meta] ||= {}

    super(objects, options)
  end
end
