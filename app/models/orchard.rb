class Orchard < ApplicationRecord
  has_many :fruits
  belongs_to :game
end
