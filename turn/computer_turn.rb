# frozen_string_literal: true

require_relative './turn'

SCORE_SKIP = 17

class ComputerTurn < Turn
  def run
    puts "Ход #{@player.name}"

    option = choose_option

    execute_turn(option)
  end

  private

  def choose_option
    should_skip ? 'skip' : 'draw'
  end

  def should_skip
    @player.score >= SCORE_SKIP || @player.too_many_cards?
  end

  protected

  def execute_draw
    super
    puts "Игрок #{@player.name} берет карту, теперь у него #{@player.hand.cards.size} карт"
  end
end
