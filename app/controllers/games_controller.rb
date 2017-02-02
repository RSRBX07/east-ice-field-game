class GamesController < ApplicationController
  def index
    @games = Game.recent
  end

  def new
    @game = Game.new
  end

  def create
    game.save
    redirect_to game_path id: Game.last.id
  end

  def show
    begin
      @game = Game.find params[:id]
    rescue => exception
      redirect_to root_path, notice: "Le jeu #{params[:id]} n'existe pas"
    end
  end

  def set_status_to_win
    game = Game.find params[:id]
    game.status = "win"
    game.save
    redirect_to root_path
  end

  def set_status_to_lost
    game = Game.find params[:id]
    game.status = "loose"
    game.save
    redirect_to root_path
  end

end
