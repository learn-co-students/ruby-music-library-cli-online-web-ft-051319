require_relative './parent.rb'

class Song
 attr_accessor :name
 attr_reader :artist
 
 @@all = []
 
 def initialize(name, artist = nil)
    @name = name
    self.artist = artist
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
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