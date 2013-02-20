# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'yui/rails/version'

Gem::Specification.new do |s|

  s.name      = 'yui-rails'
  s.version   = YUI::Rails::VERSION
  s.platform  = Gem::Platform::RUBY

  s.summary       = 'YUI integration with Rails 3.1+'
  s.description   = 'Easy integration of YUI with the Rails asset pipeline.'

  s.authors   = ["Matt Sanders"]
  s.email     = 'matt@modal.org'
  s.homepage  = 'https://github.com/nextmat/yui-rails'

  #s.executables         = []
  s.required_rubygems_version = '>= 1.3.6'

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_paths = ["lib"]
  s.extra_rdoc_files = ["LICENSE"]

  # Dependencies, this syntax requires RubyGems > 1.2.0
  s.add_development_dependency 'rails', '~>3.1'
end

