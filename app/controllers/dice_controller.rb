class DiceController < ApplicationController
  def roll
    dice = Dice.find params[:id]
    dice.roll
    dice.save
    dice.game.last_player_action = "roll"
    dice.game.save
    redirect_to game_path
  end
end
