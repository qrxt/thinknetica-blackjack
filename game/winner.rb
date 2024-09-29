# frozen_string_literal: true

module Winner
  def give_rewards(winners)
    winners.each do |winner|
      reward = @bank / winners.size

      puts "Игрок #{winner.name} получает #{reward}"

      winner.balance += reward
      @bank -= reward
    end
  end

  def winners
    return @players if @player.score == @dealer.score

    winner = @players.reject(&:too_much_score).max_by(&:score)

    [winner]
  end

  def announce_winner
    if winners.size > 1
      puts "Ничья! Игрок #{@player.name} набрал #{@player.score} очков, #{@dealer.name} набрал #{@dealer.score}"

      return
    end

    winner = winners.first

    puts "Игрок #{winner.name} победил со счетом #{winner.score}"
  end
end
