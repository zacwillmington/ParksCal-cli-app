require "open-uri"
require "nokogiri"
require "pry"

class ParksCal::Scrape
    attr_accessor :parks_site_url, :park_name, :park_info_url

    @@all_parks = []

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
        #p = ParksCal::Scrape.new
        #@park_name = parks.reject(&:empty?)# Find out why .css was returning empty elements
        # binding.pry
        # Maybe change method to create instance objects of each location in order for it to be easier to work with. Set the instance's parks_site_url then use that object to scrape each page in the #scrape_data and call Place.new in the objects on each iteration. Make @@all_names contains objects with two attrs to make it easy on ya.
    end

    def scrape_data
        binding.pry
        self.scrape_names.each do |p|
            binding.pry
            park_array = p.split(",")
            binding.pry
            html = open(park_array[2])
            park_info_url = Nokogiri::HTML(html)
            binding.pry
            # adress = park_info_url.search("div.itempropdress").text
        end
    end

    def self.all
        @@all_parks
    end

end

# SELECTING a ELEMENTS
# #anch_11, #anch_16 #anch_21, #anch_11
