
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
   end
   
   def save
     @@all << self
    end
    
    def self.states
     @@states.uniq.sort
    end
    
    def self.find_breweries_by_state(state)
     brewery= @@all.select {|brewery| brewery.state == state}
     brewery_names = brewery.collect(&:name)
     brewery_names
    end
end
