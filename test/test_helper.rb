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

class Test::Unit::TestCase

  def score_strip
    VCR.use_cassette("score_strip") do
      NFL::LiveUpdate.score_strip
    end
  end

  def game_center
    VCR.use_cassette("game_center") do
      score_strip.games.first.game_center
    end
  end

end
