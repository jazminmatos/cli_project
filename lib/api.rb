#handle all of our API requests (sending GET requests)

class API
    def self.pokemon_info
        url = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151"
        uri = URI.parse(url)
        response = Net::HTTP.get(uri)
        pokemon_list = JSON.parse(response)["results"] #why "results", why doesn't [3] work?
        
        pokemon_list.each_with_index do |p, n|
            a = Pokemon.new
            a.name = p["name"]
            a.list_order = n + 1

            puts "#{a.list_order}. #{a.name}"
        end
    end

    #if input is a number
    def self.fetch_pokemon(num) #list number
        url = "https://pokeapi.co/api/v2/pokemon/#{num}"
        uri = URI.parse(url)
        response = Net::HTTP.get(uri)
        pokemon_abilities = JSON.parse(response)["abilities"]

        pokemon_abilities.collect {|a| a["ability"]["name"]} #is it possible to NOT hardcode "ability" & "name"???
        #need to figure out why I can't get access to y[0]???
        binding.pry
    end

    #if input is a pokemon name
    # def self.fetch_pokemon(pokemon)
    #     url = "https://pokeapi.co/api/v2/pokemon/#{pokemon}" # or number???
    #     uri = URI.parse(url)
    #     response = Net::HTTP.get(uri)
    #     y = JSON.parse(response)
        
    # end
end

# list of 20 pokemon: https://pokeapi.co/api/v2/pokemon/ (paginated page)
# list of original 151 pokemon: https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151
    #iterate over the list pokemons above and list them
#Ask user to select a number to learn more a pokemon's abilities and 
    # Retrieve pokemon info: https://pokeapi.co/api/v2/pokemon/{id or name}/
        # abilities (I think all of them have 2 listed abilities), base_experience, forms, stats, types?, weights
