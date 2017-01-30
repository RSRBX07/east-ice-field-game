class FruitsController < ApplicationController
  def crop
    fruit = Fruit.find fruit_params[:id]
    fruit.crop
    if fruit.save
      redirect_to game_path(fruit.game)
    else
      redirect_to game_path(fruit.game), notice: "#{fruit.error.messages}"
    end
  end

  private

  def fruit_params
    params.permit :id
  end
end
