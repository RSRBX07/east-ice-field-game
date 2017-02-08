class Dice < ApplicationRecord
  belongs_to :game

  before_create :roll

  def roll
    self.showing_face = faces.sample
  end

  def showing_face
    super.to_sym
  end

  private

  def faces
    Game::COLORS + [:crow, :basket]
  end

end
