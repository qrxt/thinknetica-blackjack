# frozen_string_literal: true

require_relative './game/game'

def start
  name = prompt_for_name
  game = Game.new(name)

  game.run
end

def prompt_for_name
  puts 'Введите имя игрока:'

  gets.chomp
end

start
