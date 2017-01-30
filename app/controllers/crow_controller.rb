class CrowController < ApplicationController
  def move
    rules = Rules.find params[:id]

    if rules.get_allowed_action "craw"
      crow = Crow.find params[:id]
      crow.advancement = crow.advancement + 1
      crow.save
      rules.remove_allowed_action("craw")
      redirect_to game_path, notice: "Le corbeau avance d'une case"
    else
      redirect_to game_path, notice: "Impossible de bouger le corbeau"
    end
  end
end
