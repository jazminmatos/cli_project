#interactions w/ user
#contain all of our gets & puts
#controls the flow of our program

class CLI
    def start 
        API.pokemon_info #gets list of pokemon and makes each entry a Pokemon object
        # API.p_ability
        @pokemon_objects = Pokemon.all
    
        puts ""
        puts "Welcome to the Pokemon Database!"
        puts ""
        puts "Would you like to see a list of the original Pokemon? Type y/n or else Jessie, James, and Meowth will steal your information."
        puts ""
        input = gets.chomp.downcase
        puts ""
        
        if input == "y" 
            list_pokemon #display list of pokemon, calls on list_pokemon method below

            prompt

            p_input = gets.chomp.downcase
            while p_input != 'exit' do    
                if p_input == 'list'
                    list_pokemon
                elsif p_input.to_i > 0 && p_input.to_i <= @pokemon_objects.length
                    pokemon = @pokemon_objects[p_input.to_i - 1] #subtract 1 to get index number to access item in array
                    API.pokemon_ability(pokemon)
                    list_ability(pokemon)
                # elsif p_input.start_with?("ability: ")
                #     Pokemon.find_by_ability(p_input.sub("ability: ", ""))
                else 
                    puts "Please put a number between 1-151."
                end
                prompt
                p_input = gets.chomp.downcase #needs to be same as above for it to be a loop
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
    def list_pokemon
        puts ""
        puts "See below for the list of the original Pokemon!"
        puts ""
        @pokemon_objects.each.with_index(1) do |a, i|
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
    end

    def prompt
        puts ""
        puts "Would you like to see a Pokemon's abilities? Type a listed number to see more details."
        puts "OR type 'list' to see the list again."
        # puts "OR type 'ability: ' and a specific ability to search by ability."
        puts "OR type 'exit' to exit"
        puts ""
    end
end

#need to make sure we're not making another request to an API
#Practice thinking about how to iterate over Pokemon.all and finding pokemon that have the same