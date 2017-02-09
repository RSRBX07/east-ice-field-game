class Game < ApplicationRecord
  COLORS = [:red, :yellow, :blue, :green]
  has_one :orchard
  has_one :dice
  has_one :crow
  has_many :fruits, through: :orchard
  has_and_belongs_to_many :users

  before_create :setup_game


  def self.recent
    self.where(created_at: [1.day.ago..Time.now]).limit 20
  end

  def self.of_user user
    user.games
  end

  # return Game::ActiveRecord_Relation
  # give games created at within last 7 days
  def self.recent
    start_range = 1.week.ago
    stop_range = Time.now
    self.where(created_at: [start_range..stop_range]).limit 25
  end

  def self.second_page
    self.offset 25
  end

  def allow_roll?
    !(last_player_action == "roll" && (dice.showing_face == "crow" || dice.showing_face == "basket")) && (
    last_player_action != "roll" ||
    # il n'ya plus de fruit de ca couleur de la face du dé
    fruits.on_tree.of_color(dice.showing_face).count == 0)
  end

  def allow_crop? fruit
    (dice.showing_face == "basket" ||
    dice.showing_face == fruit.color) &&
    last_player_action != "crop"
  end
  false &&
  false ||
  true
  def win
    self.status = :win
    self.finished_at = DateTime.now
  end

  # private

  # def status
  #   "Crow advancement is #{crow.advancement}/6
  #   There are #{fruits.on_tree.count} fruits left in orchard."
  # end

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

