class IceFieldGame < ApplicationRecord
  ANIMALS = [:fox, :rabit, :bear, :pinguin]
  DICE_FACES = [:melt, :bridge, :igloo]
  has_one :dice
  before_create :set_game_elements

  private

  def set_game_elements
    
  end
end
