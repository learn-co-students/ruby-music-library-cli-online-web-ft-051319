
class Genre 
  extend Concerns::Findable 
  
  attr_accessor :name, :songs 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all 
  end
  
  def self.create(genre) 
    @genre = self.new(genre)
    @genre.save 
    @genre 
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
    if song.genre.nil? 
      song.genre = self 
    end
  end
  
  def artists 
    songs.collect {|songs| songs.artist}.uniq 
  end
  
end