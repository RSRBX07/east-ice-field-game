require 'rails_helper'

RSpec.describe Fruit, type: :model do
  let(:fruit) { build :fruit }
  before do
    @fruit = create :fruit
    @croped_fruit = create :fruit, :croped
    @red_fruit = create :fruit, :red
    @blue_fruit = create :fruit, :blue
    @last_croped_fruit = create :fruit, :croped
  end
  describe Fruit.on_tree do
    it { is_expected.to be_a Fruit::ActiveRecord_Relation }
    it { is_expected.to include @fruit}
    it { is_expected.not_to include @croped_fruit}
  end
  describe Fruit.on_basket do
    it { is_expected.to be_a Fruit::ActiveRecord_Relation }
    it { is_expected.not_to include @fruit}
    it { is_expected.to include @croped_fruit}
  end
  describe Fruit.of_color(:red) do
    it { is_expected.to  include @red_fruit }
    it { is_expected.not_to  include @blue_fruit }
  end
  describe Fruit.by_croped_at do
    it { is_expected.to be_a Fruit::ActiveRecord_Relation }
  end
  describe 'Fruit#crop' do
    subject { fruit.crop }
    it { is_expected.to be_a Fruit }
    it { is_expected.to be_croped_at}
  end
end
