
 require_relative './concerns/findable.rb'


require "pry"


class Artist

  extend Concerns::Findable

  
attr_accessor :name, :songs
   
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    song.artist = self unless song.artist
      songs << song unless songs.include?(song)
    # if song.artist ==nil
    #   song.artist = self
    #   songs << song
    # end
  end
  
  def genres
    songs.collect{|song| song.genre}.uniq
  end  
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    object_i = self.new(name)
    object_i.save
    object_i
  end

end