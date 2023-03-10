class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).collect { |i| verse(i) }.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.for(number)
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
