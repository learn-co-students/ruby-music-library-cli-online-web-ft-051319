require 'pry'


class Genre
    attr_accessor :name, :songs
    extend Concerns::Findable
    
    def initialize(name)
      @name = name
      @songs =[]
      # @artist=artist
      # @@all << self

    end

    def add_song(song)
      if song.genre == nil
        song.genre= self
      end
      if @songs.include?(song) == false
        @songs << song
      end
    end

    def artists
      @songs.map {|song| song.artist}.uniq
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all=[]
    end

    def save
      @@all << self
    end

    def self.create (name)
      new_genre=self.new(name)
      new_genre.save
      new_genre
    end
end
