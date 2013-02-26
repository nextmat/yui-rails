module YUI
  module Rails
    class Railtie < Rails::Railtie
      railtie_name :'yui-rails'

      rake_tasks do
        load "tasks/yui_rails_tasks.rake"
      end
    end
  end
end
