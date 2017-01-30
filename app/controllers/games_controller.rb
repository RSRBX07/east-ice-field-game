class GamesController < ApplicationController
  def index
<<<<<<< HEAD
  end

  def game
=======
    @games = Game.all
  end

  def show
    @game = Game.find params[:id]
>>>>>>> 7cad6582ead59a81b777bb1b020d807c671b50bb
  end
end
