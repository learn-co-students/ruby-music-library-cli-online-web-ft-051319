class Song

  attr_accessor :name

  @@all = []
  def initialize(name)

    @name = name
    @@all << self

  end

  def self.all
    @@all
  end

  def save
      self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create
    song = Song.new
   song = self.create
   song.save
   song
 end
end
