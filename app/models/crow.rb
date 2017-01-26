class Crow < ApplicationRecord
  belongs_to :game

  validates_numericality_of :advancement, only_integer: true, less_than: 7

  def step
    self.update_attributes advancement: self.advancement + 1
  end
end
