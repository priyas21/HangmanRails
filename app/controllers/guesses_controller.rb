class GuessesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    # @guess = @game.guesses.create(guess_params)
    @guess = @game.guesses.new(guess_params)
    if @guess.save
      flash[:success] = "The guess is valid"
    else
      flash[:notice] = @guess.errors.full_messages.to_s
    end
    redirect_to game_path(@game)
  end

  private
  def guess_params
    params.require(:guess).permit(:guessed_letter)
  end
end
