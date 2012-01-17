require 'nfl/live_update/score_strip/games'
require 'nfl/live_update/score_strip/game'

module NFL
  module LiveUpdate
    module ScoreStrip

      def self.where(params)
        Games.where(params)
      end

    end
  end
end
