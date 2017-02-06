require 'rails_helper'

RSpec.describe FruitsController, type: :controller do


  xdescribe "GET #crop" do
    it "returns http success" do
      get :crop
      expect(response).to have_http_status(:success)
    end
  end

end
