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
      #to be pulled from api
      @locations = ["Montana", "Colorado", "Oregon"]
    end
    
    def list_locations
      puts "\nChoose location to see breweries.\n"
      @locations.each_with_index do |location, index|
      puts "#{index +1}. #{location}"
    end
    end
    
    def get_user_location
        chosen_location = gets.strip.to_i
       show_breweries(chosen_location) if valid(chosen_location, @locations)
    end
    
    def valid(input, data)
      input.to_i <= data.length && input.to_i > 0 
    end
    
    def show_breweries(chosen_location)
      location = @locations[chosen_location -1]
       puts "Here are breweries for #{location}"
    end
  
  
end