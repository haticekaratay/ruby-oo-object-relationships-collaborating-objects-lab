require 'pry'
class MP3Importer

    attr_accessor :path 

    def initialize(path)
        @path = path
    end

    def files
        directories = Dir.glob("#{@path}/*.mp3")
        #binding.pry
        files = directories.collect {|path| path.split("./spec/fixtures/mp3s/").last}
        #binding.pry
        # pry(#<MP3Importer>)> songs
# ["Real Estate - It's Real - hip-hop.mp3",
#  "Real Estate - Green Aisles - country.mp3",
#  "Thundercat - For Love I Come - dance.mp3",
 #   "Action Bronson - Larry Csonka - indie.mp3"]
    end

    def import
        #binding.pry
        files.each{|song| Song.new_by_filename(song)}
        #binding.pry
    end
end
