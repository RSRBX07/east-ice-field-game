require 'rails_helper'

RSpec.describe Animal, type: :model do
  it "is named fox, bear, rabit or pinguin"
  it "is placed on ice_field, bridge or igloo"
  it "is created on ice_field"
  describe "Animal#step" do
    it "go from ice_field to bridge"
    it "go from bridge to igloo"
  end
end
