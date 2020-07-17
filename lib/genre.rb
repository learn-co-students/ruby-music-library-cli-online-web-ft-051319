require_relative "../lib/concerns/findable"

class Genre

  attr_accessor :name

  extend Concerns::Findable

  @@all=[]

  def initialize(name)
    @name=name
    @songs=[]
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre=self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
    #Song.all.select{|song| song.genre==self} -> this is single source of truth
  end

  def artists
    songs.collect{|song| song.artist}.uniq
  end

end
