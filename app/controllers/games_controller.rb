class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    begin 
      # en admettant qu'il n'exise pas de cours dont l'id soit 45
      @game = Game.find params[:id]
      Game.find 45
   rescue
     redirect_to root_path, notice: "le jeu 45  n'existe pas'"  
   end 
  end
end
