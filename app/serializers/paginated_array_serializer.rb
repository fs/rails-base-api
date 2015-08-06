class PaginatedArraySerializer < ActiveModel::ArraySerializer
  def initialize(object, options = {})
    options[:meta] ||= {}
    options[:meta].merge!(
      pagination: {
        total: object.total_count,
        per_page: object.limit_value,
        page: object.current_page
      }
    )

    super(object, options)
  end
end
