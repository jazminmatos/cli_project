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
        puts "Search for Pokemon by entering a Pokemon's name"
        puts ""
        @pokemon = gets.chomp.downcase
        puts ""
        API.pokemon_info(@pokemon)
    end
end