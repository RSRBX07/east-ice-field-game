require 'rails_helper'

RSpec.describe Dice, type: :model do
  let(:dice) { build :dice }
  describe "Dice#roll" do
    it "change showing face" do
      expect{ dice.roll }.to change{ dice.showing_face }
    end
  end
end
