
class Breweries::Location
   attr_accessor :name, :brewery_name
   @@all = []
   def initialize(name, brewery_name)
     @name = name
     @brewery_name = brewery_name
     save
    end 
     
    def self.all
      Breweries::Api.brewery_location if @@all.empty?
       @@all
      # binding.pry
   end
   
   def save
     @@all << self
    end
  
    # def find_brewery_name
    # @locations.collect{|name| location.name}.uniq
    # end
end