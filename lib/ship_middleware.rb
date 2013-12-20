   require "ship"
    class ShipMiddleware
      def initialize(app)
        @app = app
      end

      def call(env)
        #do something here
        @app.call(env)

      rescue StandardError => e
        puts e
        Ship.handle_exception(e,env)
        raise e

      end
    end