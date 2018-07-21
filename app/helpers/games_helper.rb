module GamesHelper
   def show_clue(clue)
    formatted_clue = clue.map do |c|
      c.nil? ? "\u{1f60E}" : c
    end
    formatted_clue.join(" ")
  end

  def game_progress(game)
    if game.in_progress?
      "#{game.remaining_lives.to_s} lives remaining"
    elsif game.won?
      "You have won the game. Yayyyyy \u{1f44f}"
    else
      "Sorry, you've run out of lives!\u{1f614}"
    end
  end
end
