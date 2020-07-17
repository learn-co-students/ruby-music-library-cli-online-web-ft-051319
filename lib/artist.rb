require "pry"

class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song) #adds a song to an artist with song object
    if song.artist ||= self #if the songs artist doesnt exist, create it
    @songs.include?(song) ? song : @songs << song # if songs array includes the song, do nothing, else add it
    end
  end

  # def add_song(song)
  #   song.artist = self unless song.artist
  #   songs << song unless songs.include?(song)
  # end

  def genres #returns unique genres for an artist
    @songs.map {|song| song.genre }.uniq
  end

end
