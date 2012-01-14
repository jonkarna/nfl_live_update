require 'test_helper'

module NFL
  module LiveUpdate
    module GameCenter

      class GameTest < Test::Unit::TestCase

        context "The Game Class" do
          subject { NFL::LiveUpdate::GameCenter::Game }

          should "construct the proper relative url" do
            assert_equal "/1/1_gtd.json", subject.send(:relative_url, 1)
          end

          should "request and initialize object during find" do
            subject.expects(:relative_url).with(1).returns("test")
            subject.expects(:get).with("test")
            subject.expects(:new)
            subject.find(1)
          end

        end

        context "A Game" do
          subject do
            game_center
          end

          should "respond to getter methods" do
            assert_respond_to subject, :home
            assert_respond_to subject, :away
            assert_respond_to subject, :json
            assert_respond_to subject, :id
            assert_respond_to subject, :next_update
          end

        end

      end

    end
  end
end
