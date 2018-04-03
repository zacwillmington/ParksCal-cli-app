class ParksCal::CLI


    attr_accessor :places

    def call
        puts "Welcome, Here is a list of popular National parks and Monuments around California"
        sleep 3
        puts "This will only take a second."
        sleep 3
        puts "Scraping the web..."
        parks = ParksCal::Scrape.new
        parks.scrape_names
        parks.scrape_data
        list_parks_monuments
        leave_msg
    end

    def list_parks_monuments
        puts "Select a number for more info or exit"
        @places = ParksCal::Place.all
        binding.pry
        @places.each do |place|
            puts "#{place.index}. #{place.name}"
        end
        puts "Where would you like to go?"
        input = nil
        while input != 'exit'
            input = gets.strip
               case input
               when '1'
                  puts "object 1"
               when '2'
                   puts "cabrillo info"
               when '3'
                   puts "Castle info"
               when '4'
                   puts "info"
               when '5'
                   puts "info"
               else
                   puts "Please select a number between 1 and 5 or exit"
               end
       end
    end

    def leave_msg
        puts "Thanks for coming"
    end
end
