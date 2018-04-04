require 'pry'

class ParksCal::Place

    attr_accessor :index, :name, :address, :directions, :opening_hrs

    @@all = []

    def initialize(index, name, address, directions, opening_hrs)
        @index = index
        @name = name
        @address = address
        @directions = directions
        @opening_hrs = opening_hrs
        @@all << self
    end

     def self.all
         @@all
     end
end
