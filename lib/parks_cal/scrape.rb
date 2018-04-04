require "open-uri"
require "nokogiri"
require "pry"

class ParksCal::Scrape
    attr_accessor :parks_site_url

    def initialize
        @parks_site_url = "https://www.nps.gov/state/ca/list.htm?program=parks"
    end

    def scrape_names
        html = open(@parks_site_url)
        doc = Nokogiri::HTML(html)
        park_names = doc.search("li.clearfix")
        index = 1
        parks = []
        park_names.each do |name|
            park_name = name.css("h3 a").text
            info_url = name.at_css('li a:contains(" Basic Information")')

            if park_name != "" && info_url
                parks << "#{index},#{park_name},#{info_url["href"]}"
                index += 1
            end
        end
        parks
    end

    def scrape_data
        self.scrape_names.each do |p|
            park_array = p.split(",")
            park_info_url = Nokogiri::HTML(open(park_array[2]))
            address = park_info_url.at("//div[@itemprop = 'address']").children.text.squeeze
            directions = park_info_url.search("div.directions span").text
            opening_hrs = park_info_url.search("div.HoursSection ul").text

            if directions == ""
             directions = nil
            end
            if opening_hrs == ""
                opening_hrs = "Opening hours not available."
            end
            ParksCal::Place.new(park_array[0], park_array[1], address, directions, opening_hrs)
        end
    end

end
