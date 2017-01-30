class DiceController < ApplicationController
  def roll
    dice = Dice.find params[:id]
    dice.roll
    dice.save
    
    rules = Rules.find params[:id]

    rules.add_allowed_action dice
    
    redirect_to game_path
  end
end

