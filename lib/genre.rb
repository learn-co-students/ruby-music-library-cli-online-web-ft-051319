class Genre
  attr_accessor :name
  @@all = []
  
  extend Concerns::Findable
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def songs
    @songs
  end
  
  def artists
    artist_array = @songs.collect { |song| song.artist }
    artist_array.uniq
  end
  
  def add_song(song)
    if song.genre == nil
      song.genre = self
    end
    
    if @songs.find { |song_inst| song_inst == song } == nil
      @songs << song
    end
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end
end