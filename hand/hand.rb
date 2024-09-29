# frozen_string_literal: true

class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def draw(deck)
    @cards << deck.draw
  end

  def card_labels
    @cards.map(&:label).join(', ')
  end

  def value
    counter = 0

    @cards.reject(&:ace?).each { |card| counter += card.value(counter) }
    @cards.filter(&:ace?).each { |card| counter += card.value(counter) }

    counter
  end
end
