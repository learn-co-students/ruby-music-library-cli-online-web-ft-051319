require_relative './concerns/findable.rb'
require_relative './parent.rb'
require "pry"


class Artist
  
attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.artist ==nil
      song.artist = self
      @songs << song
    end
  end
 
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