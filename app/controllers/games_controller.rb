class GamesController < ApplicationController
  def index
    @games = Game.recent.second_page
  end

  def show
    @game = Game.find params[:id]
  end

  def win
    #recherche du jeu
    game = Game.find params[:id]
    #gagner le jeu
    game.win
    game.save!
    #sauvegarder le jeu
    
    redirect_to  root_path
  end
end
