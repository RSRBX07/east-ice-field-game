class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    begin
    @game = Game.find params[:id]
    rescue
      redirect_to games_path, flash: {notice: "on ne peut pas trouver le jeu #{params[:id]}"}
    end
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

  def loose
    #recherche du jeu
    game = Game.find params[:id]
    #gagner le jeu
    game.loose_game
    
    #sauvegarder le jeu
    game.save!
    redirect_to  root_path
  end
end
