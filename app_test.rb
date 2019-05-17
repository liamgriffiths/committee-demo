require_relative "app"
require "minitest/autorun"
require "rack/test"
require "committee"
require "byebug"

class AppTest < Minitest::Test
  include Rack::Test::Methods
  include Committee::Test::Methods

  def app
    Sinatra::Application
  end

  def committee_options
    schema = Committee::Drivers::load_from_file("./openapi.yml")
    { schema: schema }
  end

  def request_object
    last_request
  end

  def response_data
    [last_response.status, last_response.headers, last_response.body]
  end

  def test_schema
    get "/hello"
    byebug
    assert_schema_conform
  end
end
