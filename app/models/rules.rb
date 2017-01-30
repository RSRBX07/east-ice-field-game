class Rules < ApplicationRecord
  belongs_to :game
  before_create :init_values
  

  def init_values
    self.crow_allowed_moves = 0
    self.crow_allowed_moves.save
  end

  def add_allowed_action target
    self.target = get_allowed_action target
    self.target += 1
    self.target.save
  end

  def remove_allowed_action target
    self.target = get_allowed_action target
    self.target -= 1
    self.target.save
  end

  def get_allowed_action target_name
    self.crow_allowed_moves
   # case target_name
   #   when "crow"
   #     return crow_allowed_moves 
   #   else
   #     return crow_allowed_moves #temporary  
   # end
  end

end