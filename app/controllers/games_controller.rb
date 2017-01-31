class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    game = Game.create
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

end
