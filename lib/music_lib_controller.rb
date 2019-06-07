class MusicLibraryController
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end
  
  def call
    input = nil 
    
    while input != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.chomp 
    end
    
    case input
    
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artist'
        self.list_songs_by_artist
      when 'list genres'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
    end
    'exit'
  end
  
  def list_songs
    Song.all.sort{|a, b| a.name <=> b.name}.each.with_index(1){|song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
    
    
    # Song.all.collect{|song| song.name}.sort.each.with_index(1).collect{|name, index| puts "#{index}. #{name.find_by_name}"}
  end
  
  def list_artists
    Artist.all.sort{|a, b| a.name <=> b.name}.each.with_index(1){|artist, index| puts "#{index}. #{artist.name}"}
  end
  
  def list_genres
    Genre.all.sort{|a, b| a.name <=> b.name}.each.with_index(1){|genre, index| puts "#{index}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    
    input = gets.chomp
    
    if artist = Artist.find_by_name(input)
     artist.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1){|song, index| puts "#{index}. #{song.name} - #{song.genre.name}"}
    # if artist.all.include?(input) == true
    #   input.select(|artist| artist.name == input).each.with_index(1){|artist, index| "#{index}. #{artist.songs
    end
  end
  
  def list_songs_by_genre
    
    puts "Please enter the name of a genre:"
    
    input = gets.chomp
    
    if genre = Genre.find_by_name(input)
      genre.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1){|song, index| puts "#{index}. #{song.artist.name} - #{song.name}"}
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    
    input = gets.chomp.to_i
    
    song_arr = Song.all.sort{|a, b| a.name <=> b.name}
    
    if input > 0 && input <=Song.all.length 
      song = song_arr[input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    else
      nil
    end
  end
  
  

end

