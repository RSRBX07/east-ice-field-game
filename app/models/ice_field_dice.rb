class IceFieldDice < ApplicationRecord
  belongs_to :ice_field_game

  def roll
    self.showing_face = faces.sample.to_s
  end


  private

  def faces
    IceFieldGame::DICE_FACES
  end

end
