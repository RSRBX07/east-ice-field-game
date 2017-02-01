class GamesController < ApplicationController
  def index
    @games = Game.recent.second_page
  end

  def show
    @game = Game.find params[:id]
  end
end
