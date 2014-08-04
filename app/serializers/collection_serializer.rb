class CollectionSerializer < ActiveModel::ArraySerializer
  def initialize(object, options = {})
    if object.respond_to?(:current_page)
      meta_key = options[:meta_key] || :meta
      options[meta_key] ||= {}
      options[meta_key][:pagination] = {
        total: object.total_count,
        per_page: object.limit_value,
        page: object.current_page
      }
    end

    super(object, options)
  end
end
