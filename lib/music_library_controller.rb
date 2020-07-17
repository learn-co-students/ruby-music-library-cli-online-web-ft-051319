class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    @path = path
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
        command = ""
    until command == "exit"
      command = gets.chomp.downcase
          if command == "list songs"
              list_songs
          elsif command == "list artists"
              list_artists
          elsif command == "list genres"
              list_genres
          elsif command == "list artist"
              list_songs_by_artist
          elsif  command == "list genre"
              list_songs_by_genre
          elsif command == "play song"
              play_song
          else  
          end
      end
  end 

    def list_songs
        alpha_array = Song.all.sort {|a, b| a.name <=> b.name}.uniq
        alpha_array.each_with_index do |song,index| 
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
      end
    end
    
    def list_artists
        alpha_array = Artist.all.sort {|a, b| a.name <=> b.name}
        alpha_array.each_with_index do |artist,index|
          puts "#{index+1}. #{artist.name}" 
          end
    end 
    
    def list_genres
        alpha_array = Genre.all.sort {|a, b| a.name <=> b.name}
        alpha_array.each_with_index do |genre,index|
          puts "#{index+1}. #{genre.name}" 
        end
    end
    
    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.chomp.downcase
        if artist = Artist.all.find {|artist| artist.name.downcase == input}
        alpha_array = artist.songs.sort {|a, b| a.name <=> b.name}.uniq
        alpha_array.each_with_index{|song, index| 
        puts "#{index+1}. #{song.name} - #{song.genre.name}"}
      else 
      end
    end
    
    def list_songs_by_genre
          puts "Please enter the name of a genre:"
          input = gets.chomp.downcase
          if genre = Genre.all.find {|genre| genre.name.downcase == input}
          alpha_array = genre.songs.sort {|a, b| a.name <=> b.name}.uniq
          alpha_array.each_with_index{|song, index| 
          puts "#{index+1}. #{song.artist.name} - #{song.name}"}
      else 
      end
    end 
    
    def play_song 
      puts "Which song number would you like to play?"
      input = gets.chomp.to_i
      alpha_array = Song.all.sort {|a, b| a.name <=> b.name}.uniq
      if input < alpha_array.count && input > 0
      puts "Playing #{alpha_array[input-1].name} by #{alpha_array[input-1].artist.name}"
    else 
    end
    end 
  
end