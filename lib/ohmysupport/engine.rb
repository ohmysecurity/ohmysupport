module Ohmysupport
  class Engine < ::Rails::Engine
    isolate_namespace Ohmysupport

    initializer "ohmysupport.assets.precompile" do |app|
      app.config.assets.precompile += %w( ohmysupport/application.css )
    end
  end
end
