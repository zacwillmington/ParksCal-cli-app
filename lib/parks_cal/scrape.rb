require "open-uri"
require "nokogiri"
require "pry"

class ParksCal::Scrape
    attr_accessor :parks_site_url, :park_names

    def initialize
        @parks_site_url = "https://www.nps.gov/state/ca/list.htm?program=parks"
    end

    def scrape_names
        html = open(@parks_site_url)
        doc = Nokogiri::HTML(html)
        #binding.pry
        park_names = doc.search(".table-cell")
        parks = park_names.collect do |name|
            name.css("h3 a").text
        end
        @park_names = parks.reject(&:empty?)# Find out why .css was returning empty elements
        binding.pry
    end

    def scrape_data(a)

    end

end
