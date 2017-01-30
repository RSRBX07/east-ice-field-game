require 'rails_helper'

RSpec.describe CrowController, type: :controller do

  describe "GET #step" do
    it "returns http success" do
      get :step
      expect(response).to have_http_status(:success)
    end
  end

end
