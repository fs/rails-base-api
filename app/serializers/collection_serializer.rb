class CollectionSerializer < ActiveModel::ArraySerializer
  def initialize(object, options = {})
    super(object, options)

    @options[meta_key] ||= {}
    @options[meta_key][:pagination] = {
      total: object.total_count,
      per_page: object.limit_value,
      page: object.current_page
    }
  end
end
