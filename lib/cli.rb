#interactions w/ user
#contain all of our gets & puts
#control the flow of our program

#  REQUIREMENTS
# Have a CLI for interfacing w/ the application
# Pull data from an external source
# Implement both list and detail views. The data provided must go at least one level deep.
# The application = DRY

class CLI
    def start
        puts ""
        puts "Welcome to the Pokemon Database!"
        puts ""
        puts "Would you like to see a list of the original Pokemon? Type y/n or else Jessie, James, and Meowth will steal your information."
        puts ""
        input = gets.chomp.downcase
        puts ""
        
        if input == "y" 
            API.pokemon_info #initializes new Pokemon objects (from pokemon.rb) using url get request (from api.rb)
            puts ""

            #display list of pokemon, calls on list_pokemon method below
            pokemon_objects = Pokemon.all
            list_pokemon(pokemon_objects)

            puts "Would you like to learn more about a specific Pokemon? Type a Pokemon's number. If not, type exit."
            puts ""
            pokemon_input = gets.chomp.downcase.to_i
            puts ""

            while pokemon_input != "exit" do
                API.pokemon_ability(pokemon_input)
                break
            end


            
            # if pokemon_input > 0 && pokemon_input < 152
            #     API.pokemon_ability(pokemon_input)
            # elsif pokemon_input < 0 || pokemon_input > 151
            #     puts "Please enter a number between 1 and 151."
            # else pokemon_input == "exit"
            #     exit
            # end

        elsif input == "n"
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
        pk.each do |a|
            puts "#{a.list_order}. #{a.name}"
        end
        puts ""
    end
end