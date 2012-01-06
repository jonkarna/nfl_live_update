module NFL
  module LiveUpdate
    module GameCenter
      class TeamStat

        attr_accessor :first_downs, :total_yards, :passing_yards,
          :rushing_yards, :penalties, :penalty_yards, :turnovers,
          :punts, :punting_yards, :punting_average, :time_of_possession

        def initialize(json)
          @first_downs = json["totfd"]
          @total_yards = json["totyds"]
          @passing_yards = json["pyds"]
          @rushing_yards = json["ryds"]
          @penalties = json["pen"]
          @penalty_yards = json["penyds"]
          @punts = json["pt"]
          @punting_yards = json["ptyds"]
          @punting_average = json["ptavg"]
          @time_of_possession = json["top"]
        end

      end
    end
  end
end
