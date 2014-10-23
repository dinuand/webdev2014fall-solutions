class Song
  
  attr_reader :title, :artist, :length, :bitrate
  
  def initialize(hash = {}) 
    @title = hash['title']
    @artist = hash['artist']
    if hash['length'] != nil
      @length = hash['length'].to_i
    end
    if hash['bitrate'] != nil
      @bitrate = hash['bitrate'].to_i
    end
  end

  def to_s
    if @length != nil
    @str = duration
    @artist + " - " + @title + " [" + @str + "]"
    else
      @artist + " - " + @title
    end
  end

  def duration
    @mins = @length / 60
    @sec = @length - @mins * 60
    if @sec < 10 
      @mins.to_s + ":0" + @sec.to_s
    else 
      @mins.to_s + ":" + @sec.to_s
    end
  end

  def ==(obj)
    return self.title == obj.title && self.artist == obj.artist && self.length == obj.length
  end

end