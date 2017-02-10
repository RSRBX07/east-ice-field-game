class Bridge < ApplicationRecord
  belongs_to :ice_field_game
  
  def melt
    self.pilars_count -= 1 unless pilars_count == 0
  end
end
