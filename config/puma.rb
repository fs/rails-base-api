workers_count = Integer(ENV["WEB_CONCURRENCY"] || 3)
threads_count = Integer(ENV["MAX_THREADS"] || 1)

workers workers_count
threads threads_count, threads_count

preload_app!

rackup DefaultRackup
port ENV["PORT"] || 3000
environment ENV["RACK_ENV"] || "development"

on_worker_boot do
  # Valid on Rails up to 4.1 the initializer method of setting `pool` size
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env] ||
             Rails.application.config.database_configuration[Rails.env]
    config["pool"] = workers_count * threads_count
    ActiveRecord::Base.establish_connection(config)
  end
end
