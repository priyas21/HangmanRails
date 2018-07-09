class BuildGame
  attr_reader :game_params

  def initialize(game_params)
    @game_params = game_params
  end

  def call
    game = Game.new(game_params)
    game.word = GenerateRandomWord.new.call
    game.initial_number_of_lives = 8
    
    game
  end
end