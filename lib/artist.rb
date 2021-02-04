require 'pry'
class Artist

    attr_accessor :name

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
       @@all#This class method should return all Artist instances. 
    end

    def add_song(song)  #the song parameter is a song instance passed in 
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self }
    end

    def self.find_or_create_by_name(artist_name)
      
        #binding.pry   #artist name as string passed as argument
         if @@all.find{|artist| artist.name == artist_name}
            @@all.find {|artist| artist.name == artist_name}

        else
            artist = Artist.new(artist_name)
        end

    end
    
    def print_songs
        Song.all.collect{ |song| 
            if song.artist == self
                puts song.name
            end
        }
    end


end