#RENAME THIS TO REFLECT PROJECT
#RENAME relative path in environment.rb

#instantiate new objects
#controlling data to create new objects

#keep track of our objects
#turn our responses into objects
#save all objects created

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
end