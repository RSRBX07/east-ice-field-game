class Fruit < ApplicationRecord
  belongs_to :orchard

  def game
    orchard.game
  end

  def self.on_tree
    self.where croped_at: nil
  end

  # Return an ActiveRecord::Relation
  # if nil is passed as color, it is treated as any
  # color (it does not scope).
  def self.of_color color
    condition = color && {color: color.downcase.to_sym}
    self.where condition
  end

  def crop
    self.croped_at = DateTime.now
  end
end
