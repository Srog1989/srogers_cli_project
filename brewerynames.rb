class Brewery_Names::Cli
     attr_accessor :name
   @@all = []
   def initialize(name)
     @name = name
     save
    end 
     
    def self.all
       @@all
   end
   
   def save
     @@all << self
   end
  
  
end
end