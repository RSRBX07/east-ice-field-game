class Animal < ApplicationRecord
  belongs_to :game, class_name: :ice_field_game
  validates :name, presence: true, inclusion: IceFieldGame::ANIMALS.map{|e| e.to_s}
  validates :place, presence: true, inclusion: IceFieldGame::PLACES.map{|e| e.to_s}
  
  def go_to place
    self.place = place
  end
end
