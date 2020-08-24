
class Breweries::Api
 URL = "https://api.openbrewerydb.org/breweries/search?query=dog"
    def self.gather_data
      uri = URI.parse(URL)
       response = Net::HTTP.get_response(uri)
       response.body
    end
    
    def self.brewery_location
     breweries=JSON.parse(self.gather_data)
      breweries.each do |brewery|
          brewery.each do |attribute,value|
            if attribute == "name"
              @name = value 
            elsif attribute == "state"
              @state = value
            Breweries::Brewery.new(@state, @name)
            # binding.pry
            end
          end
        end
      end
      
end
