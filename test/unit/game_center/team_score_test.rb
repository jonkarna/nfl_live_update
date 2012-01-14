require 'test_helper'

module NFL
  module LiveUpdate
    module GameCenter

      class TeamScoreTest < Test::Unit::TestCase

        context "A team score" do
          subject do
            game_center.home.score
          end

          should "respond to getter methods" do
            assert_respond_to subject, :first_quarter
            assert_respond_to subject, :second_quarter
            assert_respond_to subject, :third_quarter
            assert_respond_to subject, :forth_quarter
            assert_respond_to subject, :overtime
          end

        end

      end

    end
  end
end
