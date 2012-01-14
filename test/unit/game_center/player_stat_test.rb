require 'test_helper'

module NFL
  module LiveUpdate
    module GameCenter

      class PlayerStatTest < Test::Unit::TestCase

        context "A player stat" do
          subject do
            game_center.home.passing_stats.first
          end

          should "respond to getter methods" do
            assert_respond_to subject, :player_id
            assert_respond_to subject, :player_name
            assert_respond_to subject, :stats
          end

        end

      end

    end
  end
end
