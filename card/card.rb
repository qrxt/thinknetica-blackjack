# frozen_string_literal: true

class Card
  attr_reader :name

  def initialize(suit, name, value = 0)
    @suit = suit
    @name = name
    @value = value
  end

  def label
    "#{@name}#{@suit}"
  end

  def ace?
    name == 'A'
  end

  def value(score)
    ace? ? ace_value(score) : @value
  end

  def ace_value(score)
    score + 11 > 21 ? 1 : 11
  end
end
