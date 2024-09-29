# frozen_string_literal: true

require_relative '../utils/highlight'

TURN_OPTIONS = %w[skip draw reveal].freeze

TURN = {
  draw: :execute_draw,
  skip: :execute_skip,
  reveal: :execute_reveal
}.freeze

class Turn
  include Highlight

  def initialize(player, deck)
    @player = player
    @deck = deck
  end

  def execute_turn(option)
    turn = TURN[option.to_sym]

    raise "Невозможно совершить ход: #{option}" unless turn

    send(turn)
  end

  protected

  def execute_draw
    @player.hand.draw(@deck)
  end

  def execute_skip
    puts "Игрок #{@player.name} пропускает ход"
  end

  def execute_reveal
    @player.revealing = true
    puts "Игрок #{@player.name} раскрывает карты"
  end
end
