class Song

    extend Concerns::Findable

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        (artist == nil) ? (@artist = artist) : (self.artist = artist)
        (genre == nil) ? (@genre = genre) : (self.genre = genre)
    end

    def artist=(artist)
        @artist = artist
        @artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        unless @genre.songs.include?(self)
            @genre.songs << self 
        end
    end

    def save
        @@all << self 
    end

    def self.create(name)
        self.new(name).tap do |song|
            song.save
        end
    end


    def self.new_from_filename(filename)
        file = filename.split(" - ")
        song = Song.find_or_create_by_name(file[1])
        song.artist = Artist.find_or_create_by_name(file[0])
        song.genre = Genre.find_or_create_by_name(file[2].chomp(".mp3"))
        song
    end

    def self.create_from_filename(filename)
        Song.new_from_filename(filename).save
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.find_by_name(name)
        super
    end

    def self.find_or_create_by_name(name)
        super
    end

end