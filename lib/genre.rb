class Genre 
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
    new_genre = Genre.new(name)
    new_genre.save 
    new_genre
  end
  
   def songs 
    Song.all.select do |song|
      song.genre == self 
    end
  end
  
  def songs 
    @songs 
  end
  
  def artists 
    artists = songs.collect do |song|
      song.artist
    end
    artists.uniq
  end
  
end