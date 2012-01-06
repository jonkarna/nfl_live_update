module NFL
  module LiveUpdate
    module GameCenter
      class TeamScore

        attr_accessor :first_quarter, :second_quarter, :third_quarter,
          :forth_quarter, :overtime

        def initialize(json)
          @first_quarter = json["1"]
          @second_quarter = json["2"]
          @third_quarter = json["3"]
          @forth_quarter = json["4"]
          @overtime = json["5"]
        end

      end
    end
  end
end
