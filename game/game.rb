# frozen_string_literal: true

require_relative '../player/player'
require_relative '../player/dealer'
require_relative '../deck/deck'
require_relative '../turn/player_turn'
require_relative '../turn/computer_turn'
require_relative '../constants/common'
require_relative './bet'
require_relative './winner'

class Game
  include Bet
  include Winner

  attr_reader :state

  def initialize(player_name)
    @player = Player.new(player_name)
    @dealer = Dealer.new
    @deck = nil
    @players = [@player, @dealer]
    @bank = 0

    @current_player = @player
    @turn_counter = 1
    @turn = nil

    @finished = false
  end

  def run
    prepare
    game_loop
  end

  private

  def game_loop
    return finish if @finished

    @turn.run

    finish_turn

    game_loop
  end

  def finish
    announce_winner
    give_rewards(winners)

    prompt_for_continue
  end

  def prompt_for_continue
    puts 'Введите любой текст для начала новой игры'
  end

  def finish_turn
    @finished = true if should_finish

    prepare_next_turn
  end

  def should_finish
    [
      @players.any?(&:revealing),
      @players.all?(&:too_many_cards?),
      @players.any?(&:too_much_score)
    ].any?
  end

  def prepare_next_turn
    @turn_counter += 1
    @current_player = @current_player == @player ? @dealer : @player

    turn_constructor = @current_player == @player ? PlayerTurn : ComputerTurn
    @turn = turn_constructor.new(@current_player, @deck)
  end

  def prepare
    unless players_with_no_money.empty?
      players_with_no_money.each(&:display_no_money)

      return
    end

    place_bets

    @deck = Deck.new
    @turn = PlayerTurn.new(@current_player, @deck)

    @players.each(&method(:prepare_starting_hand))

    puts "Стартовая рука: #{@player.hand.card_labels}"
  end

  def prepare_starting_hand(player)
    2.times { player.hand.draw(@deck) }
  end
end
