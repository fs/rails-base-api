module ApiTaster
  class RouteCollector
    cattr_accessor :routes
    self.routes = []

    class << self
      def route(&block)
        self.routes << block
      end

      def collect!(path = "#{Rails.root}/app/api_tasters")
        self.routes = []

        Dir["#{path}/**/*.rb"].each { |file| load(file) }

        ApiTaster.routes do
          for route in RouteCollector.routes
            begin
              instance_eval(&route)
            rescue => e
              Rails.logger.error ['ApiTaster::RouteCollector:', e, e.backtrace].flatten!
            end
          end
        end
      end
    end
  end
end
