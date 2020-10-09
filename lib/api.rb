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
    end

    #gets a pokemon's abilities and shovels it into the Pokemon object's "abilities" attributes
    def self.pokemon_ability(num) #num = pokemon object that is passed in
        uri = URI(num.url)
        response = Net::HTTP.get(uri)
        pokemon_abilities = JSON.parse(response)["abilities"] #array of hashes of Pokemon abilities & their url that has info on the relative ability

        pokemon_abilities.collect do |a| 
            num.abilities << a["ability"]["name"].capitalize #shovels capitalized names of abilities into the abilities attributes of pokemon objects
        end
    end
end