class GamesController < ApplicationController

  before_action :set_game, only: [:show, :destroy]
  
  def index
    @games = Game.all
  end

  def show
  end

  def new 
    @game = Game.new
  end
  
  def create
    @game = BuildGame.new(game_params).call
    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def destroy
    @game.destroy

    redirect_to games_path
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

end
