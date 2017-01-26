class Orchard < ApplicationRecord
  has_many :fruits
  belongs_to :game

  before_create :add_fruits

  private

  def add_fruits
    Game::COLORS.each do |color|
      4.times {fruits << Fruit.new(color: color)}
    end
  end
end
