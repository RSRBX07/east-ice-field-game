class CrowController < ApplicationController
  
  def step
    crow = Crow.find params[:id]
    if crow.game.last_player_action != "step"
      crow.step
      if crow.save
        # mise à jour de l'action : pour controller l'avancement du crow, il faut connaitre la derniere action du jeu
        crow.game.last_player_action = "step"
        crow.game.save
        redirect_to game_path
      else
        redirect_to game_path, notice: "#{crow.errors.messages}"
      end
    end
  end

end
