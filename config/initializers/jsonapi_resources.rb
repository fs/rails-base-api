JSONAPI.configure do |config|
  #:underscored_key, :camelized_key, :dasherized_key, or custom
  config.json_key_format = :dasherized_key

  #:underscored_route, :camelized_route, :dasherized_route, or custom
  config.route_format = :dasherized_route

  # Default Processor, used if a resource specific one is not defined.
  # Must be a class
  # config.default_processor_klass = JSONAPI::Processor

  #:integer, :uuid, :string, or custom (provide a proc)
  config.resource_key_type = :integer

  # optional request features
  config.allow_include = true
  config.allow_sort = true
  config.allow_filter = true

  # How to handle unsupported attributes and relationships which are provided in the request
  # true => raises an error
  # false => allows the request to continue. A warning is included in the response meta data indicating
  # the fields which were ignored. This is useful for client libraries which send extra parameters.
  config.raise_if_parameters_not_allowed = true

  # :none, :offset, :paged, or a custom paginator name
  config.default_paginator = :paged

  # Output pagination links at top level
  config.top_level_links_include_pagination = true

  config.default_page_size = 10
  config.maximum_page_size = 25

  # Output the record count in top level meta data for find operations
  config.top_level_meta_include_record_count = true
  config.top_level_meta_record_count_key = :record_count

  # For :paged paginators, the following are also available
  config.top_level_meta_include_page_count = true
  config.top_level_meta_page_count_key = :page_count

  config.use_text_errors = false

  # List of classes that should not be rescued by the operations processor.
  # For example, if you use Pundit for authorization, you might
  # raise a Pundit::NotAuthorizedError at some point during operations
  # processing. If you want to use Rails' `rescue_from` macro to
  # catch this error and render a 403 status code, you should add
  # the `Pundit::NotAuthorizedError` to the `exception_class_whitelist`.
  # Subclasses of the whitelisted classes will also be whitelisted.
  config.exception_class_whitelist = []

  # Resource Linkage
  # Controls the serialization of resource linkage for non compound documents
  # NOTE: always_include_to_many_linkage_data is not currently implemented
  config.always_include_to_one_linkage_data = false

  # Relationship reflection invokes the related resource when updates
  # are made to a has_many relationship. By default relationship_reflection
  # is turned off because it imposes a small performance penalty.
  # config.use_relationship_reflection = false

  # Allows transactions for creating and updating records
  # Set this to false if your backend does not support transactions (e.g. Mongodb)
  # config.allow_transactions = true

  # Formatter Caching
  # Set to false to disable caching of string operations on keys and links.
  # Note that unlike the resource cache, formatter caching is always done
  # internally in-memory and per-thread; no ActiveSupport::Cache is used.
  # config.cache_formatters = true

  # Resource cache
  # An ActiveSupport::Cache::Store or similar, used by Resources with caching enabled.
  # Set to `nil` (the default) to disable caching, or to `Rails.cache` to use the
  # Rails cache store.
  # config.resource_cache = nil

  # Default resource cache field
  # On Resources with caching enabled, this field will be used to check for out-of-date
  # cache entries, unless overridden on a specific Resource. Defaults to "updated_at".
  # config.default_resource_cache_field = :updated_at

  # Resource cache digest function
  # Provide a callable that returns a unique value for string inputs with
  # low chance of collision. The default is SHA256 base64.
  # config.resource_cache_digest_function = Digest::SHA2.new.method(:base64digest)

  # Resource cache usage reporting
  # Optionally provide a callable which JSONAPI will call with information about cache
  # performance. Should accept three arguments: resource name, hits count, misses count.
  # config.resource_cache_usage_report_function = nil
end
