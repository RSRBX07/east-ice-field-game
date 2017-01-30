class CrowController < ApplicationController
  def step
    crow = Crow.find params[:id]
    crow.step

    redirect_to game_path if crow.save
  end
end
