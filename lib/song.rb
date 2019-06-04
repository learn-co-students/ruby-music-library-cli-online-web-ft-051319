class Song
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name

  @@all = []

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

end
