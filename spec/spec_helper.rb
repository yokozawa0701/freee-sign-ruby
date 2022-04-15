# frozen_string_literal: true

require 'freee_sign'
require 'dotenv/load'
require 'webmock/rspec'
require 'pry'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    FreeeSign.reset
    FreeeSign.access_token = 'access_token'
  end
end

def load_fixture(name)
  File.new(File.dirname(__FILE__) + "/fixtures/#{name}.json")
end

# GET
def stub_get(path, fixture, status_code = 200)
  stub_request(:get, "#{FreeeSign::ENDPOINT}#{path}")
    .with(headers: { 'Authorization' => "Bearer #{FreeeSign.access_token}", 'Content-Type' => 'application/json' })
    .to_return(body: load_fixture(fixture), status: status_code)
end

def a_get(path)
  a_request(:get, "#{FreeeSign::ENDPOINT}#{path}")
    .with(headers: { 'Authorization' => "Bearer #{FreeeSign.access_token}", 'Content-Type' => 'application/json' })
end

# POST
def stub_post(path, fixture, status_code = 200)
  stub_request(:post, "#{FreeeSign::ENDPOINT}#{path}")
    .with(headers: { 'Authorization' => "Bearer #{FreeeSign.access_token}", 'Content-Type' => 'application/json' })
    .to_return(body: load_fixture(fixture), status: status_code)
end

def a_post(path)
  a_request(:post, "#{FreeeSign::ENDPOINT}#{path}")
    .with(headers: { 'Authorization' => "Bearer #{FreeeSign.access_token}", 'Content-Type' => 'application/json' })
end

# PUT
def stub_put(path, fixture)
  stub_request(:put, "#{FreeeSign::ENDPOINT}#{path}")
    .with(headers: { 'Authorization' => "Bearer #{FreeeSign.access_token}", 'Content-Type' => 'application/json' })
    .to_return(body: load_fixture(fixture))
end

def a_put(path)
  a_request(:put, "#{FreeeSign::ENDPOINT}#{path}")
    .with(headers: { 'Authorization' => "Bearer #{FreeeSign.access_token}", 'Content-Type' => 'application/json' })
end

# DELETE
def stub_delete(path, fixture)
  stub_request(:delete, "#{FreeeSign::ENDPOINT}#{path}").
      with(:headers => {'Authorization' => "Bearer #{FreeeSign.access_token}", 'Content-Type' => 'application/json'}).
      to_return(body: load_fixture(fixture))
end

def a_delete(path)
  a_request(:delete, "#{FreeeSign::ENDPOINT}}#{path}").
      with(:headers => {'Authorization' => "Bearer #{FreeeSign.access_token}", 'Content-Type' => 'application/json'})
end
