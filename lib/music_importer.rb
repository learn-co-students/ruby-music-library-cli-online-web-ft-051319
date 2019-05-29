class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path=path
  end

  def files
    @files=Dir.entries(@path).select{|f| f.include?("mp3")}
  end

  def import
    files.each{|i| Song.create_from_filename(i)}
  end

end
