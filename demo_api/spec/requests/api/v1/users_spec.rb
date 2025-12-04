require 'rails_helper'

RSpec.describe "Api::V1::Users API", type: :request do
  let!(:user) { User.create!(name: "Joy") }

  describe "GET /api/v1/users" do
    it "returns all users" do
      get "/api/v1/users", as: :json
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json.first["id"]).to eq(user.id)
    end
  end

  describe "GET /api/v1/users/:id" do
    it "returns 404 for non-existent user" do
      get "/api/v1/users/99999", as: :json
      expect(response).to have_http_status(404)
    end
  end

  describe "POST /api/v1/users" do
    it "creates user with valid params" do
      expect {
        post "/api/v1/users", params: { user: { name: "Alice" } }, as: :json
      }.to change(User, :count).by(1)
      expect(response).to have_http_status(201)
    end

    it "returns 422 if name is missing" do
      post "/api/v1/users", params: { user: { name: nil } }, as: :json
      expect(response).to have_http_status(422)
    end

    it "returns 422 if top-level user param is missing" do
      post "/api/v1/users", params: {}, as: :json
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE /api/v1/users/:id" do
    it "returns 404 if user does not exist" do
      delete "/api/v1/users/99999", as: :json
      expect(response).to have_http_status(404)
    end
  end
end
