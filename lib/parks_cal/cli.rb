class ParksCal::CLI

    attr_accessor :places

    def call
        puts "Loading data..."
        parks = ParksCal::Scrape.new
        parks.scrape_names
        parks.scrape_data
        puts "Welcome!!!"
        sleep 1
        puts "There are many beautiful places to visit around California."
        sleep 1
        puts "Here is a list of popular national parks and monuments of California."
        sleep 3
        parks_selector
        leave_msg
    end

    def list_parks
        puts "Select a number for more info or exit.\n\n Where would you like to go?"
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
               puts "Please select a number between 1 and 34 or exit."
            end
       end
    end

    def more_info(place)
        puts "#{place.name} sounds great!"
        puts "Would you like more info? enter the appropriate number or exit."

        if place.directions != nil
            puts "1. Address"
            puts "2. Opening hours"
            puts "3. Directions"
        else
            puts "1. Address"
            puts "2. Opening hours"
        end

        input = nil

        while input != 'exit'
            input = gets.strip
            int = input.to_i
            if int.between?(1,3)
                if input == "1"
                    puts "#{place.address}"
                elsif input == "2"
                    puts "#{place.opening_hrs}"
                elsif input == "3" && place.directions != nil
                    puts "#{place.directions}"
                end
            else
                puts "Enter the appropriate number or exit."
            end
        end
    end

    def leave_msg
        puts "Thanks for coming"
    end
end
