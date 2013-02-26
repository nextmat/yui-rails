namespace :yui_rails do
  desc "Output yui_rails version and YUI version"
  task :version do
    STDOUT.puts "Using yui_rails #{YUI::Rails::VERSION} with YUI library #{YUI::Rails::YUI_VERSION}"
  end
end
