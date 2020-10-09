#keep track of our pokemon
#turns our responses into objects
#saves all pokemon created

class Pokemon
    attr_accessor :name, :url, :list_order, :abilities
    @@all = []

    def initialize(name:, url:)
        @name = name
        @url = url
        @abilities = []
        @@all << self
    end

    def self.all
        @@all
    end

    # def self.find_by_ability(ability)
    #      @@all.select {|i| i.abilities.include?(ability.capitalize)}
    #      #binding.pry
    # end
end