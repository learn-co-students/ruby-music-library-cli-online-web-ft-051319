# require "pry"

class MusicLibraryController
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip

      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end

  def list_songs
    sorted = Song.all.sort_by {|song|song.name}
    sorted.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def return_list_songs
    song_list = []
    sorted = Song.all.sort_by {|song|song.name}
    sorted.each_with_index do |song, index|
      song_list << [index + 1, song.artist.name, song.name]
    end
    song_list
  end

  def list_artists
    sorted = Artist.all.sort_by {|artist|artist.name}
    sorted.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
  end

  def list_genres
    sorted = Genre.all.sort_by {|genre|genre.name}
    sorted.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets.chomp
    if artist = Artist.find_by_name(artist_input)
      sorted = artist.songs.sort_by {|song| song.name}
      sorted.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
   puts "Please enter the name of a genre:"
   genre_input = gets.chomp
     if genre = Genre.find_by_name(genre_input)
       sorted = genre.songs.sort_by {|song| song.name}
       sorted.each_with_index do |song, index|
         puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
   puts "Which song number would you like to play?"
   song_input = gets.chomp.to_i
   return_list_songs.each do |song|
     if song[0] == song_input
       puts "Playing #{song[2]} by #{song[1]}"
     end
    end
  end
end
