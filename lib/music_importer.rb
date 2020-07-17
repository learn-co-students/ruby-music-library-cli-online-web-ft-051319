class MusicImporter

    attr_accessor :path

    def initialize(filepath)
        @path = filepath
    end

    def files
        # @files = Dir.entries(@path)
        # @files.select! {|file| file.reverse[0] == "3"}
        @files ||= Dir.glob("#{path}/*.mp3").map{ |file| file.gsub("#{path}/", "") }
    end

    def import
        files.each do |file|
            Song.create_from_filename(file)
        end
    end

end