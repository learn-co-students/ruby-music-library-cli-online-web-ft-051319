class Artist
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name
  @@all = []

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

end
