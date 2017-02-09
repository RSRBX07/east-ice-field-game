class Game < ApplicationRecord
  COLORS = [:red, :yellow, :blue, :green]
  has_one :orchard
  has_one :dice
  has_one :crow
  has_many :fruits, through: :orchard
  has_and_belongs_to_many :users

  before_create :setup_game

  scope :recent, ->() {where(created_at: [1.day.ago..Time.now])}
  scope :of_user, ->(user) {user.games}


  def allow_crop? fruit
    dice.showing_face == "basket" ||
    dice.showing_face == fruit.color &&
    last_player_action != "crop"
  end
  
  def win
    self.status = :win
    self.finished_at = DateTime.now
  end

  private

  def setup_game
    self.orchard ||= Orchard.new
    self.dice ||= Dice.new
    self.crow ||= Crow.new
  end
end
