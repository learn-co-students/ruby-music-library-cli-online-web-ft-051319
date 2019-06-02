require 'pry'

class MusicLibraryController
  attr_accessor :path
  
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    until gets.chomp == "exit"
      puts "What would you like to do?"
    end
  end
  
  def list_songs
    sorted_songs = Song.all.uniq.sort { |song_a, song_b| song_a.name <=> song_b.name }
    sorted_songs.each_with_index do |song, index|
      song_artist = song.artist.name
      song_genre = song.genre.name
      song_name = song.name
      puts "#{index + 1}. #{song_artist} - #{song_name} - #{song_genre}"
    end
  end
  
  def list_artists
    sorted_artists = Artist.all.uniq.sort { |artist_a, artist_b| artist_a.name <=> artist_b.name }
    sorted_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end
  
  def list_genres
    sorted_genres = Genre.all.uniq.sort { |genre_a, genre_b| genre_a.name <=> genre_b.name }
    sorted_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    artist_requested = Artist.all.find { |artist| artist.name == user_input }
    if artist_requested != nil
      artist_requested.songs.sort! { |song_a, song_b| song_a.name <=> song_b.name }
      artist_requested.songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    genre_requested = Genre.all.find { |genre| genre.name == user_input }
    if genre_requested != nil
      genre_requested.songs.sort! { |song_a, song_b| song_a.name <=> song_b.name }
      genre_requested.songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp.to_i
    if (1..Song.all.uniq.size).include?(user_input) && user_input.is_a?(Integer)
      sorted_songs = Song.all.uniq.sort { |song_a, song_b| song_a.name <=> song_b.name }
      song_artist = sorted_songs[user_input - 1].artist.name
      song_name = sorted_songs[user_input - 1].name
      puts "Playing #{song_name} by #{song_artist}"
    end
  end
  
end

# rspec spec/011_music_library_cli_methods_spec.rb