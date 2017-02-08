require 'rails_helper'

RSpec.describe Orchard, type: :model do
  let(:orchard) { create :orchard }
  describe "Orchard#pick_fruit" do
    it "makes a fruit being croped" do
      expect{ orchard.pick_fruit.save }.to change{ orchard.fruits.on_tree.count }.by -1
    end
  end
end
