module NFL
  module LiveUpdate
    module GameCenter

      class GameParser < HTTParty::Parser
        SupportedFormats.merge!("text/plain" => :json)
      end

      class Game
        include HTTParty
        base_uri "http://www.nfl.com/liveupdate/game-center"
        parser NFL::LiveUpdate::GameCenter::GameParser

        attr_accessor :home, :away, :json,
          :next_update, :id

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

          def find(id)
            new(get(relative_url(id)))
          end

          private
          def relative_url(id)
            "/#{id}/#{id}_gtd.json"
          end

        end

      end

    end
  end
end
