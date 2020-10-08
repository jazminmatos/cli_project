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
        puts "Would you like to see a list of the original Pokemon? Write y/n."
        puts ""
        input = gets.chomp.downcase
        puts ""
        
        #NEED TO ADD WHAT HAPPENS IF INPUT != "y" OR "n"
        #puts please put "y" or "n", or else I can't give you pokemon info :(
        case input 
            when "y" 
                API.pokemon_info
            when "n"
                exit
        end

        puts "Would you like to learn more about a specific Pokemon? Input a Pokemon's name or number. If not, input exit." #haven't decided which one to use yet. Can I do both?
        pokemon_input = gets.chomp.downcase.to_i
        puts ""
        
        if pokemon_input > 0 && pokemon_input < 152
            API.fetch_pokemon(pokemon_input)
        elsif pokemon_input < 0 || pokemon_input > 151
            puts "Please enter a number between 1 and 151."
        else pokemon_input == "exit"
            exit
        end

        # if pokemon_input = "exit"
        #     exit
        # else
        #     API.fetch_pokemon(pokemon_input)
        # end
    end
end