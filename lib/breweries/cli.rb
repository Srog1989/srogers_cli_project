require 'pry'
class Breweries::Cli
  
  def greeting
    puts "\nWelcome to the Breweries Cli!\n"
    Breweries::Api.brewery_info
    get_brewery_states
    main_menu
  end
    
   def main_menu
    list_states
    get_user_state
    next_action
    exit_program
  end
      
  def get_brewery_states
    @states = Breweries::Brewery.states
    end
  
  def list_states
    puts "\nSelect a number to see breweries.\n"
    @states.each.with_index(1) {|state, index|
    puts "#{index}. #{state}"}
  end
  
  def get_user_state
      chosen_state = gets.strip.to_i
      if valid(chosen_state, @states)
        show_breweries(chosen_state)
      else
        puts "Invalid entry, please enter a number from the list."
    end
  end
  
  def valid(chosen_state, @states)
    chosen_state <= @states.length && chosen_state > 0 
  end
  
  def show_breweries(chosen_state)
    user_state = @states[chosen_state -1]
      puts "\nHere are breweries for #{user_state}.\n"
      brewery_names = Breweries::Brewery.find_breweries_by_state(user_state)
      brewery_names.each{|brewery_name|
      puts "#{brewery_name}"}
  end
    
  def next_action
    input = ''
    while input != 'exit'
      puts "\nPlease type main menu to return to see a list of breweries in another state, or type exit to exit the program.\n"
          case input 
        when "main menu"
          main_menu
        end
      input = gets.strip
    end
  end

  def exit_program
      puts "Thank you for using Breweries Cli!"
    exit!
  end
end



