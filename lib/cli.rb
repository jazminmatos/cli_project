#interactions w/ user
#contain all of our gets & puts
#controls the flow of our program

class CLI
    def start
        API.pokemon_info #gets list of pokemon and makes each entry a Pokemon object
    
        puts ""
        puts "Welcome to the Pokemon Database!"
        puts ""
        puts "Would you like to see a list of the original Pokemon? Type y/n or else Jessie, James, and Meowth will steal your information."
        puts ""
        input = gets.chomp.downcase
        puts ""
        
        if input == "y" 
            puts ""

            #display list of pokemon, calls on list_pokemon method below
            pokemon_objects = Pokemon.all
            list_pokemon(pokemon_objects)

            prompt

            pokemon_input = gets.chomp.downcase
            while pokemon_input != 'exit' do    
                if pokemon_input == 'list'
                    list_pokemon(Pokemon.all)
                else pokemon_input.to_i == 1..151
                    pokemon = Pokemon.all[pokemon_input.to_i - 1] #subtract 1 to get index number to access item in array
                    API.pokemon_ability(pokemon)
                    list_ability(pokemon)
                end
                prompt
                pokemon_input = gets.chomp.downcase
            end

        elsif input == "n"
            puts "Goodbye :)"
            exit
        else
            puts "Jessie, James, and Meowth stole your information :(."
        end

        puts ""
    end

    #method that lists pokemon
    def list_pokemon(pk)
        puts ""
        puts "See below for the list of the original Pokemon!"
        puts ""
        pk.each.with_index(1) do |a, i|
            puts "#{i}. #{a.name}"
        end
        puts ""
    end

    #method that lists abilities
    def list_ability(pk)
        puts ""
        puts "Abilities:"
        puts ""
        puts pk.abilities
        puts ""
        puts ""
    end

    def prompt
        puts "Would you like to see a Pokemon's abilities? Type a listed number to see more details."
        puts "OR type 'list' to see the list again."
        puts "OR type 'exit' to exit"
        puts ""
    end
end

#will need to add an ask for an input 
#need to create circular logic 
#need to make sure we're not making another request to an API
#check out second video
#Practice thinking about how to iterate over Pokemon.all and finding pokemon that have the same

# if pokemon_input > 0 && pokemon_input < 152
# API.pokemon_ability(pokemon_input)
# elsif pokemon_input < 0 || pokemon_input > 151
# puts "Please enter a number between 1 and 151."
# else pokemon_input == "exit"
# exit
# end