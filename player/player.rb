# frozen_string_literal: true

require_relative '../hand/hand'
require_relative '../constants/common'

INITIAL_BALANCE = 100
MAX_CARDS = 3

class Player
  attr_reader :hand, :name
  attr_accessor :revealing, :balance

  def initialize(name)
    @name = name
    @hand = Hand.new([])
    @balance = INITIAL_BALANCE
    @revealing = false
  end

  def bet(amount = Common::DEFAULT_BET)
    @balance -= amount
    amount
  end

  def score
    @hand.value
  end

  def too_many_cards?
    @hand.cards.size >= MAX_CARDS
  end

  def too_much_score
    score > Common::MAX_SCORE
  end
end
