class Artist
  extend Concerns::ClassMethods, Concerns::Findable
  include Concerns::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self if song.artist.nil?
	end

  def genres
    self.songs.collect { | song | song.genre }.uniq
  end

  def self.all
    @@all
  end

end
