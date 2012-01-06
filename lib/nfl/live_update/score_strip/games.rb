module NFL
  module LiveUpdate
    module ScoreStrip
      class Games
        private_class_method :new

        LIVE_UPDATE_URL = "http://www.nfl.com/liveupdate/scorestrip/ss.xml"
        POST_SEASON_URL = "http://www.nfl.com/liveupdate/scorestrip/postseason/ss.xml"
        AJAX_URL = "http://www.nfl.com/ajax/scorestrip"

        attr_reader :week, :year, :type, :gd, :bph, :games

        def initialize(xml)
          gms = xml.xpath("//ss//gms").first

          attributes = gms.attributes
          attributes.each do |k,v|
            attributes[k] = v.text
          end

          @week = attributes["w"]
          @year = attributes["y"]
          @type = attributes["t"]
          @gd = attributes["gd"]
          @bph = attributes["bph"]
          @bf = attributes["bf"]

          @games = gms.xpath("//g").map {|g| Game.new(g) }
        end

        class << self

          def regular_season
            new(get(LIVE_UPDATE_URL))
          end

          def post_season
            new(get(POST_SEASON_URL))
          end

          def url(params={})
            season = params[:season]
            season_type = params[:season_type]
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
