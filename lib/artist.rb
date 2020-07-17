require_relative "../lib/concerns/findable"

class Artist

  attr_accessor :name

  extend Concerns::Findable

  @@all=[]

  def initialize(name)
    @name=name
    @songs=[]
    #this is not practicing single source of truth!
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
    artist=self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist=self if song.artist==nil
    @songs << song unless songs.include?(song)
  end

  def songs
    @songs
    # Song.all.select do |song|
    #   song.artist == self
    # end
    #THIS IS SINGLE SOURCE OF TRUTH
  end

  def genres
    songs.collect{|song| song.genre}.uniq
  end


end
