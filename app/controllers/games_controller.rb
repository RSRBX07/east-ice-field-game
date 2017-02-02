class GamesController < ApplicationController
  def index
<<<<<<< HEAD
    @games = Game.all
=======
    @games = Game.of_user(current_user).recent
>>>>>>> 34278536e8cd4add59f6c2dff1ebc7fbbd68d27c
  end

  def show
    begin
<<<<<<< HEAD
    @game = Game.find params[:id]
    rescue
      redirect_to games_path, flash: {notice: "on ne peut pas trouver le jeu #{params[:id]}"}
=======
      @game = Game.find(params[:id])
    rescue ActiveRecord::RecordNotFound => err
      puts "I m starting rescue"
      redirect_to root_path, notice: t(:not_found, scope: [:activerecord, :exceptions])
      puts "I've finished rescue"
>>>>>>> 34278536e8cd4add59f6c2dff1ebc7fbbd68d27c
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
