class Crow < ApplicationRecord
  belongs_to :game

  validates_numericality_of :advancement, only_integer: true, less_than: 7

  def in_orchard?
    puts "chek crow in orchard return #{advancement == 6}"
    advancement == 6
  end

  def step
    self.advancement = self.advancement + 1
  end
end
