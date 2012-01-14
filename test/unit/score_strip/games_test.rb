require 'test_helper'

module NFL
  module LiveUpdate
    module ScoreStrip

      class GamesTest < Test::Unit::TestCase

        context "The Games Class" do
          subject { NFL::LiveUpdate::ScoreStrip::Games }

          should "be able to get the lastest regular season score strip" do
            subject.expects(:get).with("/ss.xml")
            subject.expects(:new)
            subject.regular_season
          end

          should "be able to get the post season score strip" do
            subject.expects(:get).with("/postseason/ss.xml")
            subject.expects(:new)
            subject.post_season
          end

          should "be able to search for old score strips" do
            VCR.use_cassette("score_strip_ajax") do
              params = {:week => 1, :season => 2011, :season_type => "REG"}
              subject.where(params)
            end
          end

          should "be able to construct urls for retreiving old score strips" do
            subject.url(:week => 1, :season => 2011, :season_type => "REG")
          end

        end

        context "A Games instance" do
          subject do
            score_strip
          end

          should "respond to getter methods" do
            assert_respond_to subject, :week
            assert_respond_to subject, :year
            assert_respond_to subject, :type
            assert_respond_to subject, :gd
            assert_respond_to subject, :bph
            assert_respond_to subject, :games
          end

          should "have a type_string method" do
            assert_equal "Regular Season", subject.type_string
          end

        end

      end

    end
  end
end
