class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.new_from_filename(filename)
    file_array = filename.gsub(".mp3", "").split(" - ")
    new_song = Song.find_or_create_by_name(file_array[1])
    new_artist = Artist.find_or_create_by_name(file_array[0])
    new_genre = Genre.find_or_create_by_name(file_array[2])
    new_song.artist = new_artist
    new_song.genre = new_genre
    new_song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name)
    if found_song == nil
      self.create(name)
    else
      found_song
    end
  end
  
  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
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