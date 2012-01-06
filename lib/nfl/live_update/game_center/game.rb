module NFL
  module LiveUpdate
    module GameCenter
      class Game

        attr_accessor :home, :away, :json

        def initialize(json)
          @next_update = json.delete("nextupdate")
          @id = json.keys.first
          json = json[@id.to_s]
          @home = Team.new(json["home"])
          @away = Team.new(json["away"])

          @json = json
          @json.delete("home")
          @json.delete("away")
        end

        class << self

          def test_game
            eid = "2011122500"
            url = "http://www.nfl.com/liveupdate/game-center/#{eid}/#{eid}_gtd.json"
            new(JSON.parse(open(url).readlines.join))
          end

        end

      end
    end
  end
end
