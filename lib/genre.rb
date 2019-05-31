require_relative "./concerns/findable.rb"

class Genre

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

    def artists
        artists = songs.map {|song| song.artist}
        artists.uniq     
    end

    def save
        @@all << self 
    end

    def self.create(name)
        self.new(name).tap do |genre|
            genre.save
        end
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

end