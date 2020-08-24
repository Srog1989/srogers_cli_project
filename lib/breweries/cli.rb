require 'pry'
class Breweries::Cli
  def greeting
    puts "\nHi, and welcome to the Breweries Cli!\n"
    get_brewery_locations
    list_locations
    get_user_location
    #show_breweries
    
  end
    
    def get_brewery_locations
      @locations = Breweries::Location.all
      
    end
    
    def list_locations
      puts "\nSelect a number see breweries.\n"
      @locations.each.with_index(1) {|location, index|
      puts "#{index}. #{location.name}"}
    end
    
    def get_user_location
        chosen_location = gets.strip.to_i
        if valid(chosen_location, @locations)
          show_breweries(chosen_location)
        else
          puts "Invalid entry, please enter a number from the list."
     end
    end
    
    def valid(input, data)
      input.to_i <= data.length && input.to_i > 0 
    end
    
    def show_breweries(chosen_location)
      location = @locations[chosen_location -1]
       puts "Here are breweries for #{location.name}"
       brewery_name = location.brewery_name
       puts "#{brewery_name}"
      # binding.pry
    end
    
    # def find_brewery_name
    # @locations.collect{|location| location.name}.uniq
    # end
  
  
end