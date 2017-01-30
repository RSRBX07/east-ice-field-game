require 'rails_helper'

RSpec.describe CrowController, type: :controller do

  describe "GET #move" do
    it "returns http success" do
      get :move
      expect(response).to have_http_status(:success)
    end
  end

end
