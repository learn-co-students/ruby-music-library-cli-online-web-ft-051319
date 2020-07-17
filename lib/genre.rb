class Genre
  extend Concerns::ClassMethods, Concerns::Findable
  include Concerns::InstanceMethods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def artists
    self.songs.collect { | song | song.artist }.uniq
  end

  def self.all
    @@all
  end


end
