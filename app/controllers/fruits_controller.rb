class FruitsController < ApplicationController
  def crop
      fruits = Fruits.find params[:id]
      fruits.crop
      fruits.save
      redirect_to game_path(fruits.game)
    end

end
