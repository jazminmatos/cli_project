#keep track of our pokemon
#turns our responses into objects
#saves all pokemon created

class Pokemon
    attr_accessor :name, :url, :abilities
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
end