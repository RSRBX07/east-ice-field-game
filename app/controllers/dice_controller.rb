class DiceController < ApplicationController
  def roll
    dice = Dice.find params[:id]
    dice.roll
    dice.save
    redirect_to game_path
  end
end
