require_relative './parent.rb'

class Song
 attr_accessor :name
 attr_reader :artist, :genre
 
 def artist=(artist)
    @artist = artist
    artist.add_song(self)
 end
 
 def genre=(genre)
   @genre = genre
   if genre.songs.include?(self) == false
     genre.songs << self  
   end
  # genre.add_song(self)
 end
  
 @@all = []
 
 
 def initialize(name, artist = nil, genre = nil)
    @name = name
   
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
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