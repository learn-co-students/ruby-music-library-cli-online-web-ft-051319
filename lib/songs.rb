require_relative './parent.rb'

class Song
 attr_accessor :name
 attr_reader :artist
 
 def artist=(artist)
    @artist = artist
    artist.add_song(self)
 end
  
 @@all = []
 
 
 def initialize(name, artist = nil)
    @name = name
    @artist = artist
    if artist != nil
      self.artist=(artist)
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