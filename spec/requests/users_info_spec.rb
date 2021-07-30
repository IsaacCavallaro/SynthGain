require 'rails_helper'

RSpec.describe "UsersInfos", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users_info/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/users_info/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/users_info/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/users_info/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/users_info/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
