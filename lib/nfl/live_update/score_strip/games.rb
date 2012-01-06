module NFL
  module LiveUpdate
    module ScoreStrip
      class Games

        LIVE_UPDATE_URL = "http://www.nfl.com/liveupdate/scorestrip/ss.xml"
        AJAX_URL = "http://www.nfl.com/ajax/scorestrip"

        def initialize(xml)
          gms = xml.xpath("//ss//gms").first

          @week = gms.attribute("w").value
          @year = gms.attribute("y").value
          @type = gms.attribute("t").value
          @gd = gms.attribute("gd").value
          @bph = gms.attribute("bph").value
          @games = gms.xpath("//g").map {|g| Game.new(g) }
        end

        class << self

          def current
            new(get(LIVE_UPDATE_URL))
          end

          def url(params={})
            season = params[:season] || Time.now.year
            season_type = params[:season_type] || "REG"
            week = params[:week]
            "#{AJAX_URL}?season=#{season}&seasonType=#{season_type}&week=#{week}"
          end

          def where(params)
            new(get(url(params)))
          end

          def get(url)
            Nokogiri::XML(open(url))
          end

        end

      end
    end
  end
end
