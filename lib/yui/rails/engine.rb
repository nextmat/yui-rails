module YUI
  module Rails

    # This engine class adds the gem's vendored assets to sprockets' load path
    class Engine < ::Rails::Engine
      initializer 'yui-rails.load_static_assets' do |app|
        app.middleware.use ::ActionDispatch::Static, "#{root}/vendor"
      end
    end

  end
end
