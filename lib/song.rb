
class Song
    attr_accessor :name, :artist

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        #binding.pry
        artist_name= filename.split(" - ")[0]
        song_name = filename.split(" - ")[1]
        song = self.new(song_name)
        song.artist_name=(artist_name)
        song
        #binding.pry
    end
    
    def artist_name=(name)
        artist_instance = Artist.find_or_create_by_name(name)
        self.artist = artist_instance
        artist_instance.add_song(self)
        
        #binding.pry
    end
end