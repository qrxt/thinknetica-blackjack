# frozen_string_literal: true

require_relative '../card/card'

SUITS = ['♠', '♥', '♦', '♣'].freeze
CARD_SET = %w[J Q K A].freeze

class Deck
  attr_reader :cards

  def initialize
    @cards = generate_deck
    shuffle
  end

  def draw
    card = @cards.first
    discard

    card
  end

  private

  def shuffle
    @cards = @cards.shuffle
  end

  def discard
    @cards = @cards.drop(1)
  end

  def generate_deck
    SUITS.flat_map { |suit| generate_set(suit) }
  end

  def generate_set(suit)
    numeric_cards.concat(CARD_SET).map do |name|
      Card.new(suit, name, value(name))
    end
  end

  def numeric_cards
    (2..10).to_a
  end

  def value(name)
    name.is_a?(Numeric) ? name : 10
  end
end
