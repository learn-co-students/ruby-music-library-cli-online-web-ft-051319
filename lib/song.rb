class Song
  extend Concerns::ClassMethods
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
