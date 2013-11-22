require 'sinatra'
require 'rack/cache'
require File.expand_path('../combohandler', __FILE__)

use Rack::Cache,
  :verbose     => true,
  :metastore   => 'file:./cache/rack/meta',
  :entitystore => 'file:./cache/rack/body',
  :default_ttl => 86400,
  :allow_reload => false,
  :allow_revalidate => true

run Medley
