module NFL
  module LiveUpdate
    module GameCenter
      class Team

        attr_accessor :abbr, :time_outs, :players, :score, :stats

        def initialize(json)
          @abbr = json["abbr"]
          @time_outs = json["to"]
          @players = json["players"]

          @score = TeamScore.new(json["score"])
          @stats = json["stats"]
          @stats.each do |k,v|
            self.class.class_eval do
              define_method("#{k}_stats") do
                @stats[k]
              end
            end
            @stats[k] = if k == "team"
                          TeamStat.new(@stats[k])
                        else
                          @stats[k].map do |k2,v2|
                            PlayerStat.new(k2, v2)
                          end
                        end
          end
        end

        def stat_categories
          @stats.keys
        end

      end
    end
  end
end
