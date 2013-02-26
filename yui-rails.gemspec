# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'yui/rails/version'

Gem::Specification.new do |s|

  s.name      = 'yui-rails'
  s.version   = YUI::Rails::VERSION
  s.platform  = Gem::Platform::RUBY

  s.summary       = 'YUI integration with Rails 3.1+'
  s.description   = 'Easy integration of YUI #{YUI::Rails::YUI_VERSION} with the Rails asset pipeline.'

  s.authors   = ["Matt Sanders", "Benjamin Fleischer"]
  s.email     = ['matt@modal.org','dev@benjaminfleischer.com']
  s.homepage  = 'https://github.com/bf4/yui-rails'

  s.required_rubygems_version = '>= 1.3.6'

  s.files = Dir["vendor/**/*.js"] + Dir["lib/**/*"] + ["README.md", "CHANGELOG.md", "LICENSE"]
  s.test_files   = Dir["test/**/**"]

  s.require_paths = ["lib"]
  s.extra_rdoc_files = ["LICENSE"]
  s.license          = "MIT"

  s.add_dependency 'rails', '>=3.1'
end

