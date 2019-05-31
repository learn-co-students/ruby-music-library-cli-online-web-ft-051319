require_relative "./concerns/findable.rb"

class Artist

    extend Concerns::Findable

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name 
        @songs = []
    end

    def songs
        @songs
    end

    def save
        @@all << self 
    end

    def genres
        genres = songs.map {|song| song.genre}
        genres.uniq     
    end

    def add_song(song)
        song.artist = self unless song.artist
        songs << song unless songs.include?(song)
    end

    def self.create(name)
        self.new(name).tap do |artist|
            artist.save
        end
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

end