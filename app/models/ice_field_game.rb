class IceFieldGame < ApplicationRecord
  ANIMALS = [:fox, :rabit, :bear, :pinguin]
  DICE_FACES = [:melt, :bridge, :igloo]
  PLACES = [:ice_field, :bridge, :igloo]
  has_one :dice, class: IceFieldDice
  has_many :animals
  has_one :bridge
  before_create :setup_game



  def win
    self.status = :win
    self.finished_at = DateTime.now
  end

  private

  def setup_game
    self.dice ||= IceFieldDice.new
    ANIMALS.each do { |name| self.animals << Animal.new name: name }
    self.bridge ||= Bridge.new
  end
end
