require "pry"

class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    music=MusicImporter.new(path)
    #music.files
    music.import
  end

  def call
    input=nil
    while input!="exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input=gets.chomp

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
    #need to include the 'case' block within the while block otherwise it won't work
  end

  def list_songs
    list=Song.all.map{|song| [song.artist.name,song.name,song.genre.name]}.sort_by{|song| song[1]}
    list=list.map{|song| song.join(" - ")}
    list.each_with_index{|song,index| puts "#{index+1}. #{song}"}
  end

  def list_artists
    list=Artist.all.map{|artist| artist.name}.sort
    list.each_with_index{|artist,index| puts "#{index+1}. #{artist}"}
  end

  def list_genres
    list=Genre.all.map{|genre| genre.name}.sort
    list.each_with_index{|genre,index| puts "#{index+1}. #{genre}"}
  end

  def list_songs_by_artist
    input=gets.chomp
    puts "Please enter the name of an artist:"
    if Song.all.map{|song| song.artist.name}.include?(input)
      list = Song.all.select{|song| song if song.artist.name==input}.sort_by{|song| song.name}
      list.each_with_index{|song,index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
    else
      return
    end
  end

  def list_songs_by_genre
    input=gets.chomp
    puts "Please enter the name of a genre:"
    if Song.all.map{|song| song.genre.name}.include?(input)
      list = Song.all.select{|song| song if song.genre.name==input}.sort_by{|song| song.name}
      list.each_with_index{|song,index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
    else
      return
    end
  end

  def play_song
    song_list=Song.all.map{|song| [song.artist.name,song.name,song.genre.name]}.sort_by{|song| song[1]}.map{|song| song.join(" - ")}
    #had to retype the line above from #list_songs because if i mentioned #list_songs anywhere in this block, it would print the last line of #list_songs
    #which then triggered the error:
    # (#<IO:<STDOUT>>).puts("1. Thundercat - For Love I Come - dance")
    #      expected: 0 times with any arguments
    #      received: 1 time with arguments: ("1. Thundercat - For Love I Come - dance")

    puts "Which song number would you like to play?"
    input=(gets.chomp).to_i
    if input.is_a?(Integer) && (1...song_list.size).to_a.include?(input)
      song=song_list[input-1].split(" - ")
      puts "Playing #{song[1]} by #{song[0]}"
    else
      return
    end
  end

end
