class GamesController < ApplicationController
  
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new 
    @game = Game.new
  end
  
  def create
    @game = Game.new(game_params)
    @game.word_to_be_guessed = GenerateRandomWord.new.words
    @game.initial_number_of_lives = 8
    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:name, :number_of_lives, :word_to_be_guessed)
  end

end
