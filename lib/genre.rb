

class Genre
  extend Concerns::Findable
   
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def artists
    @songs.collect {|song| song.artist}.uniq
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