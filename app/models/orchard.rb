class Orchard < ApplicationRecord
  has_many :fruits
  belongs_to :game
  
  validates_numericality_of  :fruits_count, equal_to: 16, on: :save

  before_create :add_fruits

  # Pick a fruit of any given color or
  # of any color if no argument is given.
  def pick_fruit color=nil
    return false unless self.fruits.on_tree.of_color(color).any?
    self.fruits.on_tree.of_color(color).sample.crop
  end

  private

  def add_fruits
    Game::COLORS.each do |color|
      4.times {fruits << Fruit.new(color: color)}
    end
  end

  def fruits_count
    self.fruits.count
  end

  def fruits_of_color color_or_nil
    self.fruits.of_color color_or_nil
  end

end
