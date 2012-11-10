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

        attr_accessor :home, :away, :next_update, :id, :json
        attr_reader :raw_json, :raw_hash

        def initialize(h)
          @raw_json = h.to_json
          @raw_hash = JSON.parse(@raw_json)

          @next_update = h.delete("nextupdate")
          @id = h.keys.first
          h = h[@id.to_s]
          @home = Team.new(h["home"])
          @away = Team.new(h["away"])

          # new stuff found on saints 49 game live
          @clock = h["clock"]
          @down = h["down"]
          @drives = h["drives"]
          # id -> drive, crntdrv -> (id of current drive)
          @note = h["note"]
          @posteam = h["posteam"] # abbr for possessing team
          @quarter = h["qtr"]
          @redzone = h["redzone"] # bool
          @to_go = h["togo"] # 4th and 10 (the 10)
          @yard_line = h["yl"]
          # end of new
          #
          # new stuff found on an old game
          @media = h["media"]
          @scoring_summary = h["scrsummary"] # need more info
          @stadium = h["stadium"]
          @weather = h["weather"]
          # end of another new
        end

        class << self

          def find(id)
            new(get(relative_url(id)))
          end

          private
          def relative_url(id, update="gtd")
            "/#{id}/#{id}_#{update}.json"
          end

        end

      end

    end
  end
end
