class Breweries::Brewery

   attr_accessor :state, :name

   @@all = []
   @@states = []

  def initialize(state, name)
    @state = state
    @name = name
    @@states << state
    save
  end 
     
  def self.all
    @@all
  end
   
  def save
    @@all << self
  end
    
  def self.states
    @@states.uniq.sort
  end
    
  def self.find_breweries_by_state(user_state)
    breweries = @@all.select {|brewery| brewery.state == user_state}
    brewery_names = breweries.collect(&:name)
    brewery_names
  end
end
