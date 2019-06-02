require_relative './parent.rb'

class Genre
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  # def add_song(song)
  #     if song.genre ==nil
  #       song.genre = self
  #       # if self.songs.(song) == nil
  #         @songs << song
  #       # end
  #     elsif song.genre == self
  #       # if self.songs.find(song) == nil
  #         @songs << song
  #       # end
  #     end
  
  # end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    object_i = self.new(name)
    object_i.save
    object_i
  end
  
end