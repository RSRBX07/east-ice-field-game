class Game < ApplicationRecord
  COLORS = [:red, :yellow, :blue, :green]
  has_one :orchard
  has_one :dice
  has_one :crow
  has_many :fruits, through: :orchard

  #return Game::ActiveRecor_Relation
  def self.order_by_last_recently_played
    self.order :updated_at, :desc

  end

  before_create :setup_game

  #return Game::ActiveRecor_Relation 
  #give games created at within last 7 days

  def self.recent
    start.range= 1.week.ago
    stop.range=  Time.now
    self.where created_at: [start_range..stop_range]
  end  


  # private

  def status
    "Crow advancement is #{crow.advancement}/6
    There are #{fruits.on_tree.count} fruits left in orchard."
  end

  def roll_dice
    dice.roll
    case dice.showing_face
    when :crow
      crow.step
    when :basket
      orchard.pick_fruit
    else
      color = dice.showing_face
      orchard.pick_fruit color
    end
  end

  def setup_game
    self.orchard ||= Orchard.new
    self.dice ||= Dice.new
    self.crow ||= Crow.new
  end
end
