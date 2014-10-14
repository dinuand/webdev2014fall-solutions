class Bear
  attr_reader :size
  attr_accessor :color
  def initialize(size = nil, color = nil)
   @size = size
   @color = color 
  end
end

class CaptiveBear < Bear
  def initialize(size = nil, color = nil)
    super(size, color)
    self.class.track_bear
  end
  def self.track_bear
  	@counter += 1 if @counter != nil
  end
  def self.capture(bear) 
  	new(bear.size, bear.color)  # I'm in my own class
  end
  def self.reset_tracking
    @counter = 0
  end
  def self.tracked_bears
    @counter
  end
end

# some examples for better basics understanding
captiveB = CaptiveBear.new(:big, :blue)
puts "Captive Bear's size: #{captiveB.size}"    # => :big
puts "Captive Bear's color: #{captiveB.color}"  # => :blue
normalB = Bear.new(:small, :red)
captiveB2 = CaptiveBear.capture(normalB)
puts " #size: I'm normal: #{normalB.size}, I'm captive: #{captiveB2.size}"
puts "#color: I'm normal: #{normalB.color}, I'm captive: #{captiveB2.color}"
p CaptiveBear.tracked_bears  # => nil, counter not initialized
CaptiveBear.reset_tracking   # => @counter = 0
captiveB3 = CaptiveBear.new(:big, :brown)
p CaptiveBear.tracked_bears  # => @counter = 1
captiveB4 = CaptiveBear.new(:vvvBig, :darkBrown)
p CaptiveBear.tracked_bears  # => @counter = 2
