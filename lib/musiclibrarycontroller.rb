require 'pry'


class MusicLibraryController


    def initialize(path = './db/mp3s')
      # binding.pry
      music_importer = MusicImporter.new(path)
      music_importer.import
    end

    def call
      puts "Welcome to your music library!"
      puts  "To list all of your songs, enter 'list songs'."
      puts  "To list all of the artists in your library, enter 'list artists'."
      puts  "To list all of the genres in your library, enter 'list genres'."
      puts  "To list all of the songs by a particular artist, enter 'list artist'."
      puts  "To list all of the songs of a particular genre, enter 'list genre'."
      puts  "To play a song, enter 'play song'."
      puts  "To quit, type 'exit'."

      choices =[]
      exitflg = false
      until choices.last == "exit" do


      puts  "What would you like to do?"

      choices << gets.chomp
      end
      choices.each do |choice|
          if choice == "list songs"
            self.list_songs
          elsif choice == "list artists"
            self.list_artists
          elsif choice == "list genres"
            self.list_genres
          elsif choice == "list artist"
            self.list_songs_by_artist
          elsif choice == "list genre"
            self.list_songs_by_genre
          elsif choice == "play song"
            self.play_song
          elsif choice == "exit"
            0
          end
        end


        # artist = Artist.find_by_name(choice)
        # if artist == nil
        #   puts "No such artist"
        # end
    end

    def list_songs
      index = 1
      sortsongs = Song.all.sort {|a, b| a.name <=> b.name}
      # binding.pry
      sortsongs.each do |song|
          puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        index += 1
      end
      sortsongs
    end

    def list_artists
      index = 1
      sortartists = Artist.all.sort {|a, b| a.name <=> b.name}
      # binding.pry
      sortartists.each do |artist|
          puts "#{index}. #{artist.name}"
        index += 1
      end
    end

    def list_genres
      index = 1
      Genre.all.sort {|a, b| a.name <=> b.name}.each do |genre|
          puts "#{index}. #{genre.name}"
        index += 1
      end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      ainput = gets.chomp
      chosenartist = Artist.find_by_name(ainput)
      index = 1
      if chosenartist != nil
        Song.all.select {|song| song.artist.name == chosenartist.name}.sort {|a, b| a.name <=> b.name}.each do |song_a|
          puts "#{index}. #{song_a.name} - #{song_a.genre.name}"
        index += 1
        end
      end

    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      ginput = gets.chomp
      chosengenre = Genre.find_by_name(ginput)
      index = 1
      if chosengenre != nil
        Song.all.select {|song| song.genre.name == chosengenre.name}.sort {|a, b| a.name <=> b.name}.each do |song_g|
          puts "#{index}. #{song_g.artist.name} - #{song_g.name}"
          # binding.pry
        index += 1
        end
      end
    end

    def play_song
    #    songlist=self.list_songs
        songlist = Song.all.sort {|a, b| a.name <=> b.name}
        # songlist = self.list_songs

        puts "Which song number would you like to play?"
        songinput = gets.strip

        songindex = songinput.to_i - 1
        # binding.pry
        if songindex > 0 && songindex < songlist.length

          songselect = songlist[songindex]
            # binding.pry
           puts "Playing #{songselect.name} by #{songselect.artist.name}"
        end
      end

end
