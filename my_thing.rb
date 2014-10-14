class Bear
  attr_reader :size
  attr_accessor :color
  def initialize(size = nil, color = nil)
   @size = size
   @color = color 
  end
end

class CaptiveBear < Bear
  attr_reader :size, :color
  def initialize(size = nil, color = nil)
    super(size, color)
	self.class.track_bear
  end
  def self.track_bear
  	@counter += 1 if @counter != nil
  end
  def self.capture(bear) 
  	new(bear.size, bear.color) # I'm in my own class
  end
  def self.reset_tracking
    @counter = 0
  end
  def self.tracked_bears
    @counter
  end
end
