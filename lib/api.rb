#handle all of our API requests (sending GET requests)

class API
    def self.pokemon_info
        url = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151"
        uri = URI.parse(url)
        response = Net::HTTP.get(uri)
        pokemon_list = JSON.parse(response)["results"] #why "results", why doesn't [3] work?
        #binding.pry
    end

    def self.fetch_pokemon(pokemon)
        url = "https://pokeapi.co/api/v2/pokemon/#{pokemon}" # or number???
        uri = URI.parse(url)
        response = Net::HTTP.get(uri)
        y = JSON.parse(response)
        #binding.pry
    end
end

# list of 20 pokemon: https://pokeapi.co/api/v2/pokemon/ (paginated page)
# list of original 151 pokemon: https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151
    #iterate over the list pokemons above and list them
#Ask user to select a number to learn more a pokemon's abilities and 
    # Retrieve pokemon info: https://pokeapi.co/api/v2/pokemon/{id or name}/
