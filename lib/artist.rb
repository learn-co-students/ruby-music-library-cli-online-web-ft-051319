require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs
  @@all = []

  extend Concerns::Findable


  def initialize(name)
    @name = name
    @songs = []
#    @@all << self
  end

  def save
    @@all << self
  end

  def add_song(song)
    if song.artist == nil
      song.artist= self
    end
    if @songs.include?(song) == false
      @songs << song
    end
  end

  def songs
    @songs
  end

  def genres
    @songs.map {|song| song.genre}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all=[]
  end



end
