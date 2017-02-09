class Dice < ApplicationRecord
  belongs_to :game

  def roll
    self.showing_face = faces.sample.to_s
  end

  private

  def faces
    Game::COLORS + [:crow, :basket]
  end

end
