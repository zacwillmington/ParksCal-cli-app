require "open-uri"
require "nokogiri"
require 'pry'

class ParksCal::Scrape
    attr_accessor :parks_site_url, :park_name

    def initialize
        @parks_site_url = "https://www.nps.gov/state/ca/list.htm?program=parks"
    end

    def scrape_names
        #loop through pages h3 elements selecting name of Locations.
        html = open(@parks_site_url)
        doc = Nokogiri::HTML(html)
        #binding.pry
    end

    def scrape_data(a)

    end

end
