
class Artist 
  extend Concerns::Findable

  
  attr_accessor :name, :songs, :genres 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all 
  end
  
  def self.create(artist) 
    @artist = self.new(artist)
    @artist.save 
    @artist 
  end
  
  def self.destroy_all 
    self.all.clear 
  end
  
   def self.count 
    @@all.size 
  end
  
  def save 
    @@all << self 
  end
  
  def add_song(song)
    self.songs << song unless songs.include?(song)
    if song.artist.nil? 
      song.artist = self 
    end
  end
  
  def genres 
    songs.collect {|song| song.genre}.uniq
  end
        
    
end 