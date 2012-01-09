module NFL
  module LiveUpdate
    module ScoreStrip

      class GamesParser < HTTParty::Parser
        def xml
          Nokogiri::XML(body)
        end
      end

      class Games
        include HTTParty
        base_uri "http://www.nfl.com/liveupdate/scorestrip"
        parser NFL::LiveUpdate::ScoreStrip::GamesParser

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
        private_class_method :new

        def type_string
          case @type
          when "R"
            "Regular Season"
          when "POST"
            "Post Season"
          else
            @type
          end
        end

        class << self

          def regular_season
            new(get("/ss.xml"))
          end

          def post_season
            new(get("/postseason/ss.xml"))
          end

          def url(params={})
            season = params[:season]
            season_type = params[:season_type]
            week = params[:week]
            "#{AJAX_URL}?season=#{season}&seasonType=#{season_type}&week=#{week}"
          end

          def where(params)
            ajax_url = url(params)
            response = HTTParty.get(ajax_url)
            new(Nokogiri::XML(response.body))
          end

        end

      end

    end
  end
end
