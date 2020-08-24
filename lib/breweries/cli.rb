require 'pry'
class Breweries::Cli
  
  def greeting
    puts "\nHi, and welcome to the Breweries Cli!\n"
    get_brewery_locations
    list_locations
    get_user_location
  end
   
    def get_brewery_locations
      Breweries::Brewery.all
      @states = Breweries::Brewery.states
     end
    
    def list_locations
      puts "\nSelect a number to see breweries.\n"
      @states.each.with_index(1) {|state, index|
      puts "#{index}. #{state}"}
    end
    
    def get_user_location
        chosen_location = gets.strip.to_i
        if valid(chosen_location, @states)
          show_breweries(chosen_location)
        else
          puts "Invalid entry, please enter a number from the list."
     end
    end
    
    def valid(input, data)
      input.to_i <= data.length && input.to_i > 0 
    end
    
    def show_breweries(chosen_location)
      state = @states[chosen_location -1]
       puts "\nHere are breweries for #{state}.\n"
       brewery_names = Breweries::Brewery.find_breweries_by_state(state)
       brewery_names.each{|brewery_name|
       puts "#{brewery_name}"}
    end
  
end