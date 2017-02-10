class IceFieldGame < ApplicationRecord
  ANIMALS = [:fox, :rabbit, :bear, :pinguin]
  DICE_FACES = [:melt, :bridge, :igloo]
  PLACES = [:ice_field, :bridge, :igloo]
  has_one :dice, class_name: IceFieldDice
  has_many :animals, autosave: true
  has_one :bridge
  before_create :setup_game



  def win
    self.status = :win
    self.finished_at = DateTime.now
  end

  private

  def setup_game
    self.dice ||= IceFieldDice.new
    ANIMALS.map { |name| self.animals.build(name: name) }
    self.bridge ||= Bridge.new
  end
end
