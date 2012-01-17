require 'json'
require 'nokogiri'
require 'open-uri'
require 'httparty'

require 'nfl/live_update/score_strip'
require 'nfl/live_update/game_center'

module NFL
  module LiveUpdate

    def self.score_strip
      NFL::LiveUpdate::ScoreStrip::Games.regular_season
    end

  end
end
