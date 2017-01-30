class CrowController < ApplicationController
  def step
    crow = Crow.find params[:id]
    crow.step
    if crow.save
      redirect_to game_path
    else
      redirect_to game_path, notice: "message d'erreur"
    end
  end
end
