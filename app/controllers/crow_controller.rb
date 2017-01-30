class CrowController < ApplicationController
  def step
    crow = Crow.find params[:id]
    crow.step
    if crow.save
      redirect_to game_path
    else
      redirect_to game_path, notice: "#{fruit.error.messages}"
    end
  end

  private

  def step_params
    params.permit :id
  end
end
