require 'pry'


class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    entries = Dir.entries(@path)
    entries.shift
    entries.shift
  #   binding.pry
  #   entries.map {|fullfile| File.basename(fullfile)}
  # end

    entries
  end
end
