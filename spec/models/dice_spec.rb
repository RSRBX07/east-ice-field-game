require 'rails_helper'

RSpec.describe Dice, type: :model do
  let(:dice) { build :dice }
  it "is initalized with a showing face" do
    expect(dice.showing_face).not_to be_nil
  end
  describe "Dice#roll" do
    it "change showing face" do
      expect{ dice.roll }.to change{ dice.showing_face }
    end
  end
end
