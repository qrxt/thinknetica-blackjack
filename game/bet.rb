# frozen_string_literal: true

require_relative '../constants/common'

module Bet
  def can_player_place_bet?(player)
    player.balance >= Common::DEFAULT_BET
  end

  def display_no_money(player)
    puts "Игрок #{player.name} не имеет достаточно денег, чтобы начать игру"
  end

  def players_with_no_money
    @players.reject(&method(:can_player_place_bet?))
  end

  def place_bets
    bets_sum = @players.reduce(0) { |sum, player| sum + player.bet }

    @players.each do |player|
      puts "Игрок #{player.name} делает ставку #{Common::DEFAULT_BET}, его баланс составляет #{player.balance}"
    end

    puts "Банк составляет #{bets_sum}"

    @bank += bets_sum
  end
end
