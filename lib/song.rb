#require_relative './concerns/findable.rb'

class Song
 
  extend Concerns::Findable
  
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
  
  def self.new_from_filename(filename)
    new_fn = filename.split (" - ")
    name = new_fn[1]
    artist = Artist.find_or_create_by_name(new_fn[0])
    genre = Genre.find_or_create_by_name(new_fn[2].gsub(".mp3", ""))
    song = Song.new(name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end