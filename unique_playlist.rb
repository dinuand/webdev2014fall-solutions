# load 'song.rb' => use this if you want to print the examples

class UniquePlaylist

  attr_reader :songs

  def initialize()
    @songs = []
  end

  def add_song(song)
    if song.is_a?(Hash)
      s = Song.new(song)
      @songs << s
    else 
      @songs << song
    end
  end

  def <<(song)
    if song.is_a?(Hash)
      s = Song.new(song)
      if songs.include?(s) == false
        @songs << s
      end
    elsif songs.include?(song) == false
        @songs << song
    end
  end
  
end

=begin
playlist = UniquePlaylist.new
song = Song.new({ 'title' => "Misun", 'artist' => "Coffee", 'length' => "256" })
other_song = Song.new({ 'title' => "Misun", 'artist' => "Coffee", 'length' => '256' })
playlist << song
playlist << other_song
p playlist.songs.count  # => 1
p playlist.songs[0]
=end