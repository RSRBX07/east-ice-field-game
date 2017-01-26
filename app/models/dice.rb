class Dice < ApplicationRecord
  belongs_to :game

  before_create :roll

  def faces
    Game::COLORS + [:crow, :basket]
  end

  def roll
    self.showing_face = faces.sample
  end

end
