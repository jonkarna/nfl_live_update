require 'test_helper'

module NFL
  module LiveUpdate
    module ScoreStrip

      class GameTest < Test::Unit::TestCase

        context "A Game instance" do
          subject do
            games = NFL::LiveUpdate::ScoreStrip::Games.regular_season.games
            games.last
          end

          should "respond to getter methods" do
            assert_respond_to subject, :id
            assert_respond_to subject, :gsis
            assert_respond_to subject, :day_of_week
            assert_respond_to subject, :time_of_day
            assert_respond_to subject, :status
            assert_respond_to subject, :home_abbr
            assert_respond_to subject, :home_team_name
            assert_respond_to subject, :home_nickname
            assert_respond_to subject, :home_score
            assert_respond_to subject, :visitor_abbr
            assert_respond_to subject, :visitor_team_name
            assert_respond_to subject, :visitor_nickname
            assert_respond_to subject, :visitor_score
            assert_respond_to subject, :red_zone
            assert_respond_to subject, :ga
            assert_respond_to subject, :game_type
            assert_respond_to subject, :k
            assert_respond_to subject, :p
            assert_respond_to subject, :network
            assert_respond_to subject, :o
          end

          should "have a game_type_string method" do
            assert_equal "Regular", subject.game_type_string
          end

        end

      end

    end
  end
end
