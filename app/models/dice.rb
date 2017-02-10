class Dice < ApplicationRecord
  belongs_to :game

  def roll
    self.showing_face = faces.sample.to_s
  end

  def showing_color?
    Game::COLORS.include? showing_face.to_sym
  end

  private

  def faces
    Game::COLORS + [:crow, :basket]
  end

end
