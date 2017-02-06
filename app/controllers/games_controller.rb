class GamesController < ApplicationController
  def index
    @games = Game.recent
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.new
    game.save
    redirect_to game_path id: game.id
  end

  def show
    begin
      @game = Game.find(params[:id])
    rescue ActiveRecord::RecordNotFound => err
      puts "I m starting rescue"
      redirect_to root_path, notice: t(:not_found, scope: [:activerecord, :exceptions])
      puts "I've finished rescue"
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
    game = Game.find params[:id]
    game.status = "loose"
    game.save
    redirect_to root_path
  end

end
