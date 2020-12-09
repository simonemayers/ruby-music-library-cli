require "pry"
class Artist 
    @@all = []
    attr_accessor :name
    extend Concerns::Findable

    def initialize(name)
        @name = name 
        save 
        @songs = []
    end

    def save
        @@all << self 
    end

    def self.all
        @@all 
    end

    def self.destroy_all 
        @@all.clear 
    end

    def self.create(name)
        @name = name 
        name = self.new(name)
        name
    end

    def songs 
        @songs 
    end
    
    def add_song(song)
        @songs << song unless @songs.include? song 
        if song.artist == nil
            song.artist = self 
        end
    end

    def genres 
        songs.collect{|song| song.genre unless songs.include? song.genre}.uniq
    end
    
end