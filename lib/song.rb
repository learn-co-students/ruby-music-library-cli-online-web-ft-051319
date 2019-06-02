require "pry"

class Song

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
    all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    new_song = self.new(name, artist, genre)
    new_song.save
    new_song
  end

  def artist=(artist) #setter method that invokes artist add_song
    @artist = artist
    artist.add_song(self)#add self to an artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) ? self : genre.songs << self
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) == nil ? create(name) : find_by_name(name)
  end

  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.split(/\b(?:\W+\-\W|\.mp3)\b/)
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
  end

end
