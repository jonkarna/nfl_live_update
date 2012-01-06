require 'test_helper'

module NFL
  module LiveUpdate
    module ScoreStrip

      class GamesTest < Test::Unit::TestCase

        context "The Games Class" do
          subject { NFL::LiveUpdate::ScoreStrip::Games }

          setup do
            @live_update_url = NFL::LiveUpdate::ScoreStrip::Games::LIVE_UPDATE_URL
            @post_season_url = NFL::LiveUpdate::ScoreStrip::Games::POST_SEASON_URL
          end

          should "be able to get the lastest regular season score strip" do
            subject.expects(:get).with(@live_update_url)
            subject.expects(:new)
            subject.regular_season
          end

          should "be able to get the post season score strip" do
            subject.expects(:get).with(@post_season_url)
            subject.expects(:new)
            subject.post_season
          end

          should "be able to execute get requests" do
            subject.get(@live_update_url)
          end

          should "be able to search for old score strips" do
            params = {:week => 1, :season => 2011, :season_type => "REG"}
            subject.expects(:url).with(params)
            subject.expects(:get)
            subject.expects(:new)
            subject.where(params)
          end

          should "be able to construct urls for retreiving old score strips" do
            subject.url(:week => 1, :season => 2011, :season_type => "REG")
          end

        end

        context "A Games instance" do
          subject { NFL::LiveUpdate::ScoreStrip::Games.regular_season }

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
