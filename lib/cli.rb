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
        
        case input 
            when "y" 
                API.pokemon_info
            when "no"
                exit
        end
    end
end