
class Breweries::Brewery
   attr_accessor :state, :name
   @@all = []
   @@states =[]
   def initialize(state, name)
     @state = state
     @name = name
     @@states << state
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
    
    def self.states
      @@states.uniq
    end
    
end

#a location is a hash 
#has keys of state, name, type, etc 
#those keys would be mirrored in the attributes of your location class, i.e. your attr attr_accessors, etc.