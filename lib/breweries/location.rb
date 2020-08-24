
class Breweries::Location
   attr_accessor :name, :brewery_name, :state
   @@all = []
   def initialize(name, brewery_name)
     @name = name
     @brewery_name = brewery_name
     @state = state
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

#a location is a hash 
#has keys of state, name, type, etc 
#those keys would be mirrored in the attributes of your location class, i.e. your attr attr_accessors, etc.