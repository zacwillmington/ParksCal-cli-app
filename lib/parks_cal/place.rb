require 'pry'
class ParksCal::Place

    attr_accessor :name, :address, :info, :opening_hrs

    @@all = []

    def initialize(name, address, info, opening_hrs)
        @name = name
        @address = address
        @info = info
        @opening_hrs = opening_hrs
        @@all << self
        #binding.pry
    end

     def self.all
         @@all
        puts "1. Alcatraz Island"
        puts "2. Cabrillo"
        puts "3. Castle Mountains"
        puts "4. Channel Islands"
        puts "5. Death Valley"
     end
end
