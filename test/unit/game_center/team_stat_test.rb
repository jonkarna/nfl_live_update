require 'test_helper'

module NFL
  module LiveUpdate
    module GameCenter

      class TeamStatTest < Test::Unit::TestCase

        context "A team stat" do
          subject do
            game_center.home.team_stats
          end

          should "respond to getter methods" do
            assert_respond_to subject, :first_downs
            assert_respond_to subject, :total_yards
            assert_respond_to subject, :passing_yards
            assert_respond_to subject, :rushing_yards
            assert_respond_to subject, :penalties
            assert_respond_to subject, :penalty_yards
            assert_respond_to subject, :turnovers
            assert_respond_to subject, :punts
            assert_respond_to subject, :punting_yards
            assert_respond_to subject, :punting_average
            assert_respond_to subject, :time_of_possession
          end

        end

      end

    end
  end
end
