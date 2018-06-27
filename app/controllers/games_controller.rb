class GamesController < ApplicationController
  def new 
    
  end
  def create
    render plain: params[:game].inspect
  end

end
