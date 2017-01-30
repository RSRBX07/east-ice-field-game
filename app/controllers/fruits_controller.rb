class FruitsController < ApplicationController
  def crop
    fruit = Fruit.find params[:id]
    fruit.crop
    if fruit.save
      redirect_to game_path(fruit.game)
    else
      redirect_to game_path(fruit.game), notice: "Fail to record croped fruit. #{fruit.error.messages}"
    end

  end

  private

  # def fruit_params

  #   params
  # end
end
