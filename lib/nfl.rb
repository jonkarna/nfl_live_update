require 'json'
require 'nokogiri'
require 'open-uri'
require 'rss'

require './lib/nfl/live_update/score_strip'
require './lib/nfl/live_update/game_center'

module NFL

  def self.score_strip
    NFL::LiveUpdate::ScoreStrip::Games.current
  end

  def self.test_game
    NFL::LiveUpdate::GameCenter::Game.test_game
  end

end