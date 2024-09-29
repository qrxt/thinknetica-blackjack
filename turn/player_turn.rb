# frozen_string_literal: true

require_relative './turn'

class PlayerTurn < Turn
  def run
    puts "Рука: #{@player.hand.card_labels} (#{@player.score})"

    option = prompt_for_option

    execute_turn(option)
  end

  private

  def prompt_for_option
    puts 'Выберите вариант из списка:'
    puts "(#{highlight('skip')}) чтобы пропустить ход"
    puts "(#{highlight('draw')}) чтобы взять карту" unless @player.too_many_cards?
    puts "(#{highlight('reveal')}) чтобы раскрыть карты"

    option = gets.chomp

    turn_options.include?(option) ? option : prompt_for_option
  end

  def turn_options
    @player.too_many_cards? ? TURN_OPTIONS.reject { |option| option == 'draw' } : TURN_OPTIONS
  end

  protected

  def execute_draw
    super
    puts "Игрок #{@player.name} берет карту: #{@player.hand.cards.last.label}"
  end
end
