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
     redirect_to root_path, notice: "le jeu 45  n'existe pas'" # ou bien ecrire cela: 
     
     # alert: "le jeu #{params[:id]}n'existe pas"
     # notice: "vous avez ete rederiger vers l'acceuil du jeu"
     # mais modifier sur application.html.erb comme suite : 
   end 
  end
end
