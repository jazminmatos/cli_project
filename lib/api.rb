#handle all of our API requests (sending GET requests)

class API
    #gets list of pokemon and makes each entry a Pokemon object
    def self.pokemon_info
        url = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151"
        uri = URI.parse(url)
        response = Net::HTTP.get(uri)
        pokemon_list = JSON.parse(response)["results"] #pokemon_list = key/value pairs of "name" & "url"
        
        pokemon_list.each do |p| #p = one hash of key/value pair of "name" & "url"
            url = p["url"]
            Pokemon.new(name: p["name"].capitalize, url: url) #Pokemon object instantiated w/ name & url attributes
        end
        #binding.pry
    end

    #gets a pokemon's abilities and shovels it into the Pokemon object's "abilities" attributes
    def self.pokemon_ability(num) #num = pokemon object that is passed in
        uri = URI(num.url)
        response = Net::HTTP.get(uri)
        pokemon_abilities = JSON.parse(response)["abilities"] #array of hashes of Pokemon abilities & their url that has info on the relative ability

        pokemon_abilities.collect do |a| 
            num.abilities << a["ability"]["name"].capitalize #shovels capitalized names of abilities into the abilities attributes of pokemon objects
        
        end
        #binding.pry
    end

    #iterate over pokemon.all to add abilities into pokemon objects' abilities attributes
    # def self.p_ability
    #     Pokemon.all.each do |p|
    #         uri = URI(p.url)
    #         response = Net::HTTP.get(uri)
    #         pokemon_abilities = JSON.parse(response)["abilities"] #array of hashes of Pokemon abilities & their url that has info on the relative ability
        
    #         pokemon_abilities.collect do |a| 
    #             p.abilities << a["ability"]["name"].capitalize #shovels capitalized names of abilities into the abilities attributes of pokemon objects
    #         end
    #     end
    # end
end

# list of 20 pokemon: https://pokeapi.co/api/v2/pokemon/ (paginated page)
# list of original 151 pokemon: https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151
    #iterate over the list pokemons above and list them
#Ask user to select a number to learn more a pokemon's abilities and 
    # Retrieve pokemon info: https://pokeapi.co/api/v2/pokemon/{id or name}/
        # abilities (I think all of them have 2 listed abilities), base_experience, forms, stats, types?, weights
        #ability information: https://pokeapi.co/api/v2/ability/{name of ability}
            #within "effect_entries" => "short_effect"


# MAKE SURE YOU ONLY HIT YOUR APIS WHEN ABSOLUTELY NECESSARY!!!
