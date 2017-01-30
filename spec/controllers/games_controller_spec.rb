require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

<<<<<<< HEAD
  describe "GET #game" do
    it "returns http success" do
      get :game
=======
  describe "GET #show" do
    it "returns http success" do
      get :show
>>>>>>> 7cad6582ead59a81b777bb1b020d807c671b50bb
      expect(response).to have_http_status(:success)
    end
  end

end
