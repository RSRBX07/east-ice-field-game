require 'rails_helper'

RSpec.describe IceFieldController, type: :controller do

  describe "GET #melt" do
    it "returns http success" do
      get :melt
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #roll" do
    it "returns http success" do
      get :roll
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #step" do
    it "returns http success" do
      get :step
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
