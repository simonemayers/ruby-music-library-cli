require "pry"
class Genre 
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
        if song.genre == nil
            song.genre = self 
        end
    end

    def artists 
        songs.collect{|song| song.artist unless songs.include? song.artist}.uniq
    end

end