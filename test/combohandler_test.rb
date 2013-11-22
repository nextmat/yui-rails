require 'test/unit'
require 'fileutils'
require 'rack/test'
# require_relative 'rack_test_patch'

require File.expand_path(File.join('../../lib/yui', 'combohandler'), __FILE__)
class MedleyTest < Test::Unit::TestCase
  include Rack::Test::Methods
  include FileUtils

  TEST_FILES = Dir.glob(File.join(File.dirname(File.expand_path(__FILE__)),'fixtures') + '/*')

  def app
    Medley
  end

  def setup
    mkdir_p(app::ROOT_FILE_PATH)
    TEST_FILES.each do |file|
      linked_file_name = File.join(app::ROOT_FILE_PATH, File.basename(file))
      ln_s(file, linked_file_name) unless File.exists?(linked_file_name)
    end
  end

  def teardown
    TEST_FILES.each do |file|
      filename = File.join(app::ROOT_FILE_PATH, File.basename(file))
      rm(filename) if File.exists?(filename)
    end
  end

  def test_home_page
    get '/'
    assert_equal('Medley is running!!gninnur si yeldeM', last_response.body)
  end

  def test_should_forbid_file_requests_outside_the_public_app_root
    illegal_request_elements = ['..'] * 3
    illegal_request_elements << app::ROOT_FILE_PATH
    illegal_request_elements << "../../some_file.file"
    illegal_request = illegal_request_elements.join("/")
    get "/combo?#{illegal_request}"
    assert_equal 403, last_response.status
    assert_equal '', last_response.body
  end

  def test_should_return_404_if_a_file_is_not_found
    file_paths = TEST_FILES.map{|x| File.basename(x)}
    file_path_thats_not_there = 'some_file_that_is_totally_not_there.file'
    file_paths << file_path_thats_not_there
    get "/combo?#{file_paths.join('&')}"
    assert_equal 404, last_response.status
    assert_equal "#{file_path_thats_not_there} was not found!", last_response.body
  end

  def test_should_concatenate_files_in_the_order_they_are_requested
    file_paths = TEST_FILES.map{|x| File.basename(x)}
    concatenated_files = file_paths.map do |path|
      IO.read(File.expand_path(File.join(app::ROOT_FILE_PATH, path)))
    end.join('')

    get "/combo?#{file_paths.join('&')}"
    assert_equal 200, last_response.status
    assert_equal concatenated_files, last_response.body

    reverse_concatenated_files = file_paths.reverse.map do |path|
      IO.read(File.expand_path(File.join(app::ROOT_FILE_PATH, path)))
    end.join('')

    assert_not_equal reverse_concatenated_files, concatenated_files
    assert_not_equal reverse_concatenated_files, last_response.body

    get "/combo?#{file_paths.reverse.join('&')}"
    assert_equal 200, last_response.status
    assert_equal reverse_concatenated_files, last_response.body
  end

end
