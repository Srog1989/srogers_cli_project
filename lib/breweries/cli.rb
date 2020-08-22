require 'pry'

class Breweries::Cli
  def greeting
    puts "\nHi, and welcome to the Breweries Cli!\n"
    get_brewery_locations
    list_locations
    
    #gets Breweries for location
    #list_breweries
    
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
      chosen_location = gets.strip
    binding.pry
    end
  
  
end