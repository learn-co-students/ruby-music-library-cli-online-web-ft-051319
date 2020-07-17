class Song

    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist= nil, genre= nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
        self.save
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        @@all << self unless @@all.include?(self)
    end

    def self.create(name, artist= nil, genre= nil)
        song = self.new(name)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include? self
    end

    def self.find_by_name(name)
        all.find{|song| name == song.name}
    end

    def self.find_or_create_by_name(name)
        find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(filename)
        song_info = filename.split(" - ")
        artist, name, genre = song_info[0], song_info[1], song_info[2].chomp(".mp3")
        
        artist = Artist.find_or_create_by_name(artist)
        genre = Genre.find_or_create_by_name(genre) #title[2][0..-5])
        # song = self.new(title[1], artist, genre)
        new(name, artist, genre)
    end

    def self.create_from_filename(filename)
        new_from_filename(filename)    
    end
   
end