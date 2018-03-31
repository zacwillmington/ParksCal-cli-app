class ParksCal::CLI


    attr_accessor :places

    def call
        puts "Welcome, Here is a list of popular National parks and Monuments around California"
        list_parks_monuments
        leave_msg
    end

    def list_parks_monuments
        puts "Select a number for more info or exit"
        @places = ParksCal::Place.all
        input = nil
        while input != 'exit'
            input = gets.strip
               case input
               when '1'
                   puts "Alcratraz info"
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
