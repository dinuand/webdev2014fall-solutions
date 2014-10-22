#load 'song.rb'

class Playlist
  attr_reader :songs, :length
  def initialize()
    @songs = []
    @length = 0
  end
  def add_song(song)
    if song.is_a?(Hash)
      s = Song.new(song)
      @songs << s
      @length += s.length
    else
      @songs << song
      @length += song.length
    end
  end
  def <<(song)
    @songs << song
    @length += song.length
  end
end

playlist = Playlist.new
song = Song.new({'title' => "Hey Guy", 'artist' => "John Kerry", 'length' => "128"})
playlist << song
p playlist.length  # => 128
