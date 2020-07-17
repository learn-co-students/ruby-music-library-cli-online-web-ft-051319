class Song 
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []
 
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    new_song = self.new(name)
    new_song.save 
    if @artist != nil
      @artist.songs << new_song
    end
    new_song
  end
  
  ##def artist=(artist)
  ##  @artist = artist
   ## @artist.songs << self
  ##end
## MK version
  
    def artist=(artist)
    if @artist == nil
      @artist = artist
    end
    if self.artist != nil
      @artist.add_song(self)
    end
    @artist
  end
  ## ONLINE version
  
  def genre=(genre)
    if @genre == nil
      @genre = genre
    end
    if self.genre != nil
      genre.songs << self unless genre.songs.include?(self)
    end
    @genre
  end
   
   def self.create_from_filename(filename)
     @@all << self.new_from_filename(filename)
   end
   
   def self.new_from_filename(filename)
    #parse the filename
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre_name = filename.split(" - ")[2].chomp(".mp3")
    #create song and assign artist and genre attribute, & create connections
    #prevent the creation of duplicate objects: songs, artists, genres
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
   end
    
end