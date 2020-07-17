class Song
  extend Concerns::ClassMethods, Concerns::Findable
  include Concerns::InstanceMethods


  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    super(name)
    self.artist=(artist) unless !artist
    self.genre=(genre) unless !genre
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(filename)
      file = filename.split(" - ")
      artist_name, song_name, genre_name = file[0], file[1], file[2].gsub(".mp3", "")
      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)
      self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless self.genre.songs.include?(self)
  end

  def self.all
    @@all
  end

end
