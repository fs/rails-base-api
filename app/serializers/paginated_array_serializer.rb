class PaginatedArraySerializer < ActiveModel::Serializer::ArraySerializer
  def initialize(objects, options = {})
    options[:meta] ||= {}
    options[:meta].merge!(
      pagination: {
        total: objects.total_count,
        per_page: objects.limit_value,
        page: objects.current_page
      }
    )

    super(objects, options)
  end
end
