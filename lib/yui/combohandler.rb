# Originally from https://github.com/asee/Medley
#   with MIT license under
#   Copyright (c) 2009 American Society For Engineering Education
require 'rubygems'
require 'sinatra'
require 'sinatra/base'

class Medley < Sinatra::Base

  ROOT_FILE_PATH = File.expand_path(File.join(File.dirname(__FILE__), 'public'))

  before do
    last_modified $updated_at ||= Time.now
  end

  get '/' do
    'Medley is running!!gninnur si yeldeM'
  end

  get '/combo' do
    set_content_type
    combine_files
  end

private

  def file_list
    @file_list ||= request.query_string.split('&').map{|x| URI.unescape(x)}
  end

  def set_content_type
    if mime_type = self.class.mime_type(File.extname(file_list.first))
      content_type(mime_type)
    end
  end

  def combine_files
    file_list.map do |relative_file_path|
      absolute_file_path = File.expand_path(File.join(ROOT_FILE_PATH, relative_file_path))
      verify_path_is_in_app_root(absolute_file_path)
      begin
        IO.read(absolute_file_path)
      rescue Errno::ENOENT # File not found
        halt 404, "#{relative_file_path} was not found!"
      end
    end.join('')
  end

  def verify_path_is_in_app_root(path)
    unless path.start_with?(ROOT_FILE_PATH)
      halt 403
    end
  end

end
