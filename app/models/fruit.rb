class Fruit < ApplicationRecord
  belongs_to :orchard

  delegate :game, to: :orchard

  default_scope { self.without_orchard_id }

  def self.on_tree
    self.where croped_at: nil
  end

  # fruits = Fruit.on_basket
  def self.on_basket
    self.where.not(croped_at: nil)
  end

  def self.by_croped_at
    self.order :croped_at
  end

  def self.without_orchard_id
    self.select :color, :croped_at
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
