module NFL
  module LiveUpdate
    module ScoreStrip
      class Game

        attr_accessor :id, :gsis, :day_of_week, :time_of_day, :status,
          :home_abbr, :home_team_name, :home_nickname, :home_score,
          :visitor_abbr, :visitor_team_name, :visitor_nickname, :visitor_score,
          :red_zone, :ga, :game_type, :k, :p, :network, :o

        attr_reader :xml

        def initialize(xml)
          attributes = xml.attributes
          attributes.each do |k,v|
            attributes[k] = v.text
          end

          @id = attributes["eid"]
          @gsis = attributes["gsis"]
          @day_of_week = attributes["d"]
          @time_of_day = attributes["t"]
          @status = attributes["q"]

          @home_abbr = attributes["h"]
          @home_team_name = attributes["htn"]
          @home_nickname = attributes["hnn"]
          @home_score = attributes["hs"]

          @visitor_abbr = attributes["v"]
          @visitor_team_name = attributes["vtn"]
          @visitor_nickname = attributes["vnn"]
          @visitor_score = attributes["vs"]

          @red_zone = attributes["rz"]
          @ga = attributes["ga"]
          @game_type = attributes["gt"]

          @k = attributes["k"]
          @p = attributes["p"]
          @network = attributes["n"]
          @o = attributes["o"]
        end

        def game_type_string
          case @game_type
          when "REG"
            "Regular"
          when "WC"
            "Wild Card"
          when "CON"
            "Conference"
          when "DIV"
            "Division"
          when "PRO"
            "Pro Bowl"
          else
            @game_type
          end
        end

      end
    end
  end
end
