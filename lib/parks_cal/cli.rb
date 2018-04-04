class ParksCal::CLI

    attr_accessor :places

    def call
        parks = ParksCal::Scrape.new
        puts "Welcome, Here is a list of popular National parks and Monuments around California"
        puts "This will only take a second."
        parks.scrape_names
        puts "Scraping the web..."
        parks.scrape_data
        parks_selector
        leave_msg
    end
    def list_parks
        puts "Select a number for more info or exit"
        puts "Where would you like to go?"
        @places = ParksCal::Place.all
        @places.each do |place|
            puts "#{place.index}. #{place.name}"
        end

    end

    def parks_selector
        input = nil
        while input != 'exit'
            list_parks
            input = gets.strip
            int = input.to_i
            if int.between?(1,34)
               more_info(@places[int - 1])
               else
                   puts "Please select a number between 1 and 34 or exit"
               end
       end
    end


    def more_info(place)
        puts "#{place.name}"
        puts "What would you like more info on?"
        puts "1. Address."
        puts "2. Directions."
        puts "3. Opening hours."
        puts "Or exit"
        input = nil

        while input != 'exit'
            input = gets.strip
            int = input.to_i
            if int.between?(1,3)
                if input == "1"
                    puts "#{place.address}"
                elsif input == "2"
                    puts "#{place.directions}"
                elsif input == "3"
                    puts "#{place.opening_hrs}"
                else
                     puts "Please select a number between 1 and 3 or exit"
                end
            end
        end
    end


    def leave_msg
        puts "Thanks for coming"
    end
end
