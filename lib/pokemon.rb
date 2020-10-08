#RENAME THIS TO REFLECT PROJECT
#RENAME relative path in environment.rb

#instantiate new objects
#controlling data to create new objects

#keep track of our objects
#turn our responses into objects
#save all objects created

class Pokemon
    attr_accessor :name, :list_order
    @@all = []

    def initialize(name:, list_order:)
        @name = name
        @list_order = list_order
        @@all << self
    end

    def self.all
        @@all
    end
end