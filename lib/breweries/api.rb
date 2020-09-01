class Breweries::Api
  
 URL = "https://api.openbrewerydb.org/breweries/search?query=dog"
  
 def self.gather_data
    uri = URI.parse(URL)
      response = Net::HTTP.get_response(uri)
      response.body
  end
  
  def self.brewery_info
    breweries = JSON.parse(self.gather_data)
    breweries.each do |brewery|
      state = brewery["state"]
      name = brewery["name"]
      Breweries::Brewery.new(state, name)
    end
  end
    
end
