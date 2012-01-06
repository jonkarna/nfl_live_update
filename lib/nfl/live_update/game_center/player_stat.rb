module NFL
  module LiveUpdate
    module GameCenter
      class PlayerStat

        attr_accessor :player_id, :player_name, :stats

        def initialize(key, json)
          @player_id = key
          @player_name = json.delete("name")
          @stats = json
        end

      end
    end
  end
end
