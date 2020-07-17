class Artist 
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def self.all
    @@all 
  end
  ## artists array reader
  
  def save 
    @@all << self 
  end 
  ## saves artist into the artists array
  
  def self.destroy_all 
    @@all.clear 
  end 
  ## removes all artists from the artists array
  
  def self.create(name)
    new_artist = self.new(name)
    new_artist
  end
  ## adds a new artist and saves it into artists array
  
    def add_song(song)
       song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end
  ## if song is not already associated to current artist instance, assign to current artist instance 
  ## add song to current artist instances's @songs array unless song is already there
  
  def songs 
  @songs
    end
    ## instance reader/getter
  
   def genres
    genres = songs.collect do |song|
      song.genre
    end
    genres.uniq
  end
   ## iterates through all songs by current instance of artist array to create a new array of genres done by artist
end