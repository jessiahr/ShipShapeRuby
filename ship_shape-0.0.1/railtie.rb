require "ship_middleware"
module ShipShape
  class Railtie < Rails::Railtie
    initializer "armada.configure_rails_initialization" do
      Rails.application.middleware.use ShipMiddleware
    end

  end
end