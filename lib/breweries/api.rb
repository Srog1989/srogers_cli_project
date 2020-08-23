
class Breweries::Api
 URL = "https://api.openbrewerydb.org/breweries/search?query=dog"
    def self.gather_data
      uri = URI.parse(URL)
       response = Net::HTTP.get_response(uri)
       response.body
       #binding.pry
    end
    def self.brewery_location
     breweries=JSON.parse(self.gather_data)
      breweries.each do |brewery|
          brewery.each do |attribute,value|
            # binding.pry
            if attribute == "state"
              name = value
              Breweries::Location.new(name)
            end
          end
        end
      end
      
      # def self.
    
end
# def program_school
# # we use the JSON library to parse the API response into nicely formatted JSON
#   programs = JSON.parse(self.get_programs)
#   programs.collect do |program|
#     program["agency"]
#   end
# end
# website = CoinPriceApi.new.get_data
# puts website
# class GetPrograms
#   URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"
#   def get_programs
#     uri = URI.parse(URL)
#     response = Net::HTTP.get_response(uri)
#     response.body
#   end
# end
# programs = GetPrograms.new.get_programs
# puts programs
#