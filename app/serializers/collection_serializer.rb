class CollectionSerializer < ActiveModel::ArraySerializer
  def initialize(object, options = {})
    meta_key = options[:meta_key] || :meta
    options[meta_key] ||= {}
    options[meta_key][:pagination] = {
      total: object.total_count,
      per_page: object.limit_value,
      page: object.current_page
    }

    super(object, options)
  end
end
