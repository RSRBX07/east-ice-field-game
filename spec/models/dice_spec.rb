require 'rails_helper'

RSpec.describe Dice, type: :model do
  let(:dice) { build :dice }
  describe "Dice#roll" do
    it "change showing face" do
      allow(dice).to receive(:faces).and_return([42])
      expect{ dice.roll }.to change{ dice.showing_face }.to "42"
    end
  end
end
