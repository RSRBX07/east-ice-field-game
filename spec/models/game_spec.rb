require 'rails_helper'

RSpec.describe Game, type: :model do
  it "has a dice"
  it "has a orchard"
  it "has fruits"
  it "has a crow"
  describe "Game#allow_crop?" do
    it "est vrai si la face du de est de la couleur du fruit" do
      couleur = "red"
      autre_couleur = "blue"
      game = Game.create
      game.dice.showing_face = couleur
      cropable_fruit = game.fruits.of_color(couleur).first
      non_cropable_fruit = game.fruits.of_color(autre_couleur).first
      expect(game.allow_crop? cropable_fruit).to be true
      expect(game.allow_crop? non_cropable_fruit).to be false
    end
    it "teste si la face du de est un panier" do
      face = "basket"
      game = Game.create
      game.dice.showing_face = face
      cropable_fruit = game.fruits.first
      expect(game.allow_crop? cropable_fruit).to be true
    end
    it "teste si la derniere action n'est pas crop" do
      face = "red"
      game = Game.create
      game.dice.showing_face = face
      fruit = game.fruits.of_color(face).first
      game.last_player_action = "roll"
      expect(game.allow_crop? fruit).to be true
      game.last_player_action = "crop"
      expect(game.allow_crop? fruit).to be false
    end
  end
end
