require_relative 'song.rb'
require_relative 'playlist.rb'
require_relative 'unique_playlist.rb'

=begin
Attention at the find_by_* methods.
It doesn't mean that passing the tests you're code is correct.
e.g.: In "test_returns_songs_by_an_artist" replace the existing
line with the following: 
"assert_equal 0, @playlist.find_by_artist('xyzt').length" 
and check the test result.
=end

class FancyPlaylist < UniquePlaylist

  attr_reader :size, :find_by_artist, :find_by_title, :find_by_bitrate

  def initialize()
    super()
    @size = 0
  end
  
  def add_song(song)
    @size = @size + 1
    super(song)
  end

  ["artist", "title", "bitrate"].each do |action|
    define_method("find_by_#{action}") do |argument|
      songs_found = []
      for song in @songs 
        if action == "artist"
          item = song.artist
        elsif action == "title"
          item = song.title
        elsif action == "bitrate"
          item = song.bitrate
        end
        if item == argument
          songs_found << song
        end
      end
      return songs_found
    end
  end

  def songs_matching(regex)
    songs_matching_a_regex = []
    for song in @songs
      if song.title =~ regex
        songs_matching_a_regex << song
      end
    end
    return songs_matching_a_regex
  end

  def each(&block)
    @songs.each(&block)
  end

  def map(&block) 
    @songs.map(&block)
  end

end

# some examples for better understanding what actually happens backwards
playlist = FancyPlaylist.new
playlist.add_song({ 'artist' => "U2", 'title' => "Some tired song" })
playlist.add_song({ 'artist' => "mother", 'title' => "Another song" })
puts "there are #{playlist.size} songs in playlist"
s = playlist.find_by_artist('mother')
puts "found #{s.length} songs that match the search by artist"
q = playlist.find_by_artist('father')
puts "found #{q.length} songs that match the search by artist"
size = 0;
playlist.each { size += 1}
puts "size is #{size}"  # => size is 2
p playlist.map { |s| s.artist } # => ["U2", "mother"]