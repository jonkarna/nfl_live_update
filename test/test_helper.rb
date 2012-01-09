require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'turn'
require 'mocha'
require 'nfl/live_update'
require 'vcr'
require 'webmock'

VCR.config do |c|
  c.cassette_library_dir = "test/fixtures/vcr_cassettes"
  c.stub_with :webmock
  c.allow_http_connections_when_no_cassette = false
  c.default_cassette_options = {:record => :once}
end
