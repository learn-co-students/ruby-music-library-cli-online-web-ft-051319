require 'pry'
# require_relative '../lib/artist.rb'
#require_all '../lib'
class Song

  attr_accessor :name, :artist
  attr_reader :genre

#  extend Concerns::Flexible
#  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if (artist != nil)
      self.artist= artist
    end
    if (genre != nil)
      self.genre= genre
    end


  end

  def artist= (artist)

      @artist= artist
      @artist.add_song (self)

  end


  def genre=(genre)
      @genre = genre
      @genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all=[]
  end

  def save
    @@all << self
  end




  def self.create (name)
    new_song=self.new(name)
    new_song.save
    new_song
  end

  def self.new_from_filename (filename)
    filenoext=filename.split('.').first

    songgenre=filenoext.split(' - ').last
    songname=filenoext.split(' - ')[1]
    artistname=filenoext.split(' - ').first
    newsong=self.new(songname)

    newsong.artist= Artist.find_or_create_by_name(artistname)
    newsong.genre=Genre.find_or_create_by_name(songgenre)

    newsong

  end

  def self.create_from_filename (filename)

    createsong=self.new_from_filename(filename)
    # filenoext=filename.split('.').first
    #
    # # songgenre=artistsong.split(' - ').last
    # # songname=artistsong.split(' - ')[1]
    # #
    # # createsong=self.create(songname)
    # # createsong.artist=artistsong.split(' - ').first
    # # createsong.save
    # # createsong
    #
    # songgenre=filenoext.split(' - ').last
    # songname=filenoext.split(' - ')[1]
    # artistname=filenoext.split(' - ').first
    # createsong=self.new(songname)
    #
    # createsong.artist= Artist.find_or_create_by_name(artistname)
    # createsong.genre=Genre.find_or_create_by_name(songgenre)
    createsong.save

    createsong
  end


  # def self.find_by_name(name)
  #   @@all.find {|song| song.name == name }
  # end
  #
  # def self.find_or_create_by_name (name)
  #   namedsong = self.find_by_name(name)
  #   if namedsong == nil
  #     namedsong = self.create(name)
  #   end
  #   namedsong
  # end


end
