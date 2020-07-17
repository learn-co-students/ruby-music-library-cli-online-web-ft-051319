class Song 
  extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil 
      self.artist = artist
    if genre != nil 
      self.genre = genre
    save
  end
end

end
  
  def self.all 
    @@all 
  end
  
  def self.create(name) 
    @song = self.new(name)
    @song.save 
    @song 
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
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
   def self.new_from_filename(file)
    song = self.new(file.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(file.split(" - ")[0])
    song.artist.add_song(song)
    song.genre = Genre.find_or_create_by_name(file.split(" - ")[2].chomp(".mp3"))
    song.genre.add_song(song)
    song
  end
  
  def self.create_from_filename(file)
    new_from_filename(file).save
  end
  
  
end 