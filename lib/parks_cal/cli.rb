class ParksCal::CLI

    def call
        puts "Press 1 for Parks or 2 for Monuments"
        input = gets.strip # maybe change so if someone types a non-integer it says "please select 1 or 2"
        input == '1' ? list_parks : list_monuments
    end

    def list_parks
        puts "Select a number for more info or exit to return to menu"
        puts "1. Alcatraz Island"
        puts "2. Cabrillo"
        puts "3. Castle Mountains"
        puts "4. Channel Islands"
        puts "5. Death Valley"
        input = gets.strip
    end

    def list_monuments
        puts "Select a number for more info or exit to return to menu"
        puts "1. monuments"
        puts "2. Cab"
        puts "3. Mountains"
        puts "4. Islands"
        puts "5. Vally"
        input = gets.strip

    end
end
