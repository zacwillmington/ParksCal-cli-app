class ParksCal::Scrape
    attr_accessor :parks_site_url, :park_names_info_urls

    def initialize
        @parks_site_url = "https://www.nps.gov/state/ca/list.htm?program=parks"
        @park_names_info_urls = []
    end

    def scrape_names
        html = open(@parks_site_url)
        doc = Nokogiri::HTML(html)
        park_names = doc.search("li.clearfix")
        park_names.each_with_index do |name, index|
            park_name = name.css("h3 a").text
            info_url = name.at_css('li a:contains(" Basic Information")')

            if park_name != "" && info_url
                @park_names_info_urls << "#{index + 1 },#{park_name},#{info_url["href"]}"
            end
        end
    end

    def scrape_data
        @park_names_info_urls.each do |p|
            park_array = p.split(",")
            park_info_url = Nokogiri::HTML(open(park_array[2]))
            address = park_info_url.at("//div[@itemprop = 'address']").children.text.squeeze
            directions = park_info_url.search("div.directions span").text
            opening_hrs = park_info_url.search("div.HoursSection ul").text

            if directions.empty?
             directions = "Directions not available."
            end
            if opening_hrs == ""
                opening_hrs = "Opening hours not available."
            end
            directions = directions.gsub("Directions Details", "")
            ParksCal::Place.new(park_array[0], park_array[1], address, directions, opening_hrs)
        end
    end

end
