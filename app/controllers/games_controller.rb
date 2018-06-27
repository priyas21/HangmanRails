class GamesController < ApplicationController
  
  def index
  end
  def show
    @game = Game.find(params[:id])
  end

  def new 
    
  end
  
  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to @game
  end

  private
  def game_params
    params.require(:game).permit(:name)
  end

end
