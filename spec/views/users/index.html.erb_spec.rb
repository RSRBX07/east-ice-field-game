require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :firstname => "Firstname",
        :lastename => "Lastename",
        :nick => "Nick"
      ),
      User.create!(
        :firstname => "Firstname",
        :lastename => "Lastename",
        :nick => "Nick"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastename".to_s, :count => 2
    assert_select "tr>td", :text => "Nick".to_s, :count => 2
  end
end
