require "pry"

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files #searches for anything in the path with .mp3, returns array of filename without path
    Dir.glob("#{path}/*.mp3").map {|filename|File.basename("#{filename}")}
  end


  def import #uses Song.create_from_filename to create a song for each file
    files.each {|filename| Song.create_from_filename(filename) }
  end
end
