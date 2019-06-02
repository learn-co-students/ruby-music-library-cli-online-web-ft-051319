require_relative './concerns/findable.rb'
require_relative './parent.rb'
require "pry"

class Artist < Parent
  
  def initialize(name)
    super
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
  
end