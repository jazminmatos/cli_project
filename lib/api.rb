#handle all of our API requests (sending GET requests)

class API
    def self.pokemon_info
        url = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151"
        uri = URI.parse(url)
        response = Net::HTTP.get(uri)
        pokemon_list = JSON.parse(response)["results"]
        
        pokemon_list.each_with_index do |p, n| #p: keys = "name", "url" + their values, n: index #
            #Uses the value of the "url" key to get the ability names & instantiate an object w/ abilities as attributes below
            #this makes it really slow - any way to make it faster?
            url = p["url"]
            uri = URI.parse(url)
            response = Net::HTTP.get(uri)
            abilities = JSON.parse(response)["abilities"] #abilities[0]["ability"]["name"] will get you name of 1st ability - ["url"] instead of name will give you access to ability info

            ability_list = abilities.collect {|a| a["ability"]["name"].capitalize}

            Pokemon.new(name: p["name"].capitalize, list_order: n + 1, abilities: ability_list)
        end
    end

    #need to figure out how to have abilities as an attribute for each pokemon object
    #need to refactor it to list abilities of each Pokemon object (assuming the above is correct, will have to put this method in CLI I think)
    def self.pokemon_ability(num) #list number
        url = "https://pokeapi.co/api/v2/pokemon/#{num}"
        uri = URI.parse(url)
        response = Net::HTTP.get(uri)
        pokemon_abilities = JSON.parse(response)["abilities"]

        puts "Abilities:"
        pokemon_abilities.collect do |a| 
            ability = a["ability"]["name"].capitalize

            puts "#{ability}"
            #want to list ability description as well
        end
    end
end

# list of 20 pokemon: https://pokeapi.co/api/v2/pokemon/ (paginated page)
# list of original 151 pokemon: https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151
    #iterate over the list pokemons above and list them
#Ask user to select a number to learn more a pokemon's abilities and 
    # Retrieve pokemon info: https://pokeapi.co/api/v2/pokemon/{id or name}/
        # abilities (I think all of them have 2 listed abilities), base_experience, forms, stats, types?, weights
        #ability information: https://pokeapi.co/api/v2/ability/{name of ability}
            #within "effect_entries" => "short_effect"
