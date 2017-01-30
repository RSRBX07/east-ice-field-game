require 'rails_helper'

RSpec.describe DiceController, type: :controller do

  describe "GET #roll" do
    it "returns http success" do
      get :roll
      expect(response).to have_http_status(:success)
    end
  end

end
