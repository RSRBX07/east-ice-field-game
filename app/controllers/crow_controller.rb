class CrowController < ApplicationController
    def step
    crow = Crow.find params[:id]
    crow.step
    crow.save
    redirect_to game_path
  end

end
