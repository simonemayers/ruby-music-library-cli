require "pry"
class Song 
    @@all = []
    attr_accessor :name
    attr_reader :artist, :genre
    extend Concerns::Findable

    def initialize(name, artist = nil, genre = nil)
        @name = name  
        self.artist = artist if artist
        self.genre = genre if genre 
        save
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
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

    # def self.create(name)
    #     @name = name 
    #     name = self.new(name)
    #     name
    # end

    # def self.find_by_name(name)
    #     @@all.detect{|song| song.name == name}
    # end
    
    # def self.find_or_create_by_name(name) 
    #     find_by_name(name) || create(name)
    # end

    def self.new_from_filename(filename)
        name = filename.split(" - ")[1]
        artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
        genre = Genre.find_or_create_by_name(filename.split(" - ").last.split(".mp3")[0])
        Song.new(name, artist, genre)
    end

    def self.create_from_filename(filename)
        new_from_filename(filename).save
    end
    



end