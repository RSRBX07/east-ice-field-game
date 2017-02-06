class FruitsController < ApplicationController

  def crop
    fruit = Fruit.find fruit_params[:id]
    # valider la methode en verifiant le fruit cropé en fonction de la face du dé
    showing_face = fruit.game.dice.showing_face
    if showing_face == fruit.color
      fruit.crop
      if fruit.save
        redirect_to game_path(fruit.game)
      else
        redirect_to game_path(fruit.game), notice: "#{fruit.error.messages}"
      end
    end
  end

  private

  def fruit_params
    params.permit :id
  end
end
