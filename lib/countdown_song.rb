class CountdownSong

  attr_reader :verse_template, :min, :max

  def initialize(verse_template:, min: 0, max: 999999)
    @verse_template = verse_template
    @max = max
    @min = min
  end

  def song
    verses(max, min)
  end

  def verses(upper, lower)
    upper.downto(lower).collect { |i| verse(i) }.join("\n")
  end

  def verse(number)
    verse_template.lyrics(number)
  end
end

class BottleVerse
  attr_reader :bottle_number

  # Could separate even further
  def self.lyrics(number)
    new(BottleNumber.for(number)).lyrics
  end
  def initialize(bottle_number)
    @bottle_number = bottle_number
  end
  def lyrics
    "#{bottle_number}".capitalize + ' of beer on the wall, ' +
      "#{bottle_number} of beer.\n" +
      "#{bottle_number.action}, " +
      "#{bottle_number.successor} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number

  def self.for(number)
    registry.find { |r| r.handles?(number) }.new(number)
  end

  def self.registry
    @registry ||= [BottleNumber]
  end

  def self.register(candidate)
    registry.prepend(candidate)
  end

  def self.inherited(candidate)
    register(candidate)
  end

  def self.handles?(number)
    true
  end

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def successor
    BottleNumber.for(number - 1)
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def quantity
    number.to_s
  end

  def pronoun
    'one'
  end

  def container
    'bottles'
  end
end

class BottleNumber0 < BottleNumber

  def self.handles?(number)
    number.zero?
  end

  def quantity
    'no more'
  end

  def action
    'Go to the store and buy some more'
  end

  def successor
    BottleNumber.for(99)
  end
end

class BottleNumber1 < BottleNumber
  def self.handles?(number)
    number == 1
  end

  def pronoun
    'it'
  end

  def container
    'bottle'
  end
end

class BottleNumber6 < BottleNumber

  def self.handles?(number)
    number == 6
  end

  def quantity
    '1'
  end

  def container
    'six-pack'
  end
end

class VerseFake
  def self.lyrics(number)
    "This is verse #{number}.\n" end
end
