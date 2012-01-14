require 'test_helper'

module NFL
  module LiveUpdate
    module GameCenter

      class TeamTest < Test::Unit::TestCase

        subject do
          game_center.home
        end

        context "A Team" do

          should "respond to getter methods" do
            assert_respond_to subject, :abbr
            assert_respond_to subject, :time_outs
            assert_respond_to subject, :players
            assert_respond_to subject, :score
            assert_respond_to subject, :stats
          end

        end

        context "Team stats" do

          should "be a hash" do
            assert_instance_of Hash, subject.stats
          end

          should "be organized appropriately" do
            subject.stats.each do |k,v|
              if k == "team"
                assert_instance_of TeamStat, v
              else
                assert_instance_of Array, v
                assert_instance_of PlayerStat, v.first
              end
            end
          end

          should "have dynamic stat methods" do
            stat_keys = subject.stats.keys
            stat_keys.each do |k|
              assert_respond_to subject, "#{k}_stats"
            end
          end

        end

      end

    end
  end
end
