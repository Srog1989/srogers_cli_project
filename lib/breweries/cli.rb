require 'pry'
class Breweries::Cli
  
  def greeting
    puts "\nWelcome to the Breweries Cli!\n"
    get_brewery_locations
    list_locations
    get_user_location
    next_action
    exit_program
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
    
    
    
    def next_action
      
       input = ''
       while input != 'exit'
    puts "\nPlease type main menu to return to see a list of breweries in another state, or type exit to exit program.\n"
    
    case input 
      when "main menu"
        greeting
  end
    input = gets.strip
  end
end

    def exit_program
      puts "Thank you for using Breweries Cli!"
      exit!
    end
end