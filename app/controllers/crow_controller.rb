class CrowController < ApplicationController
  def step
    dice = Crow.find params[:id]
    dice.step
    dice.save
    redirect_to game_path
  end
end
