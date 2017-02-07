class Dice < ApplicationRecord
  belongs_to :game

  after_initialize :roll

  def roll
    self.showing_face = faces.sample
  end

  private

  def faces
    Game::COLORS + [:crow, :basket]
  end

end
