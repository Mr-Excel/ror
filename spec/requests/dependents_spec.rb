require 'rails_helper'

RSpec.describe "Dependents", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/dependents/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/dependents/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/dependents/new"
      expect(response).to have_http_status(:success)
    end
  end

end
