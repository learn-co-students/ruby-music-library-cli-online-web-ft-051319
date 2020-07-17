require "pry"


class Song

  attr_accessor :name
  attr_reader :artist, :genre


  @@all=[]

  def initialize(name,artist=nil,genre=nil)
    @name=name
    self.artist=artist if artist!=nil #the if condition becasue if no artist argument is passed, it would give rise to a nil:Class error
    self.genre=genre if genre!=nil #same for genre
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
    song=self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist=artist #this is important to prevent infinite loop
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre=genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name==name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)==nil
      song=self.create(name)
    else self.find_by_name(name)
    end
  end

  def self.new_from_filename(file)
    array=file.split(" - ")
    artist=Artist.find_or_create_by_name(array[0])
    genre=Genre.find_or_create_by_name(array[2].chomp(".mp3"))
    song=self.new(array[1],artist,genre) if self.find_by_name(array[1])==nil
    song
  end

  def self.create_from_filename(file)
    @@all << self.new_from_filename(file)
  end



end
