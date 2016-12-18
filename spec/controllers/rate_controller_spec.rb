require 'rails_helper'

RSpec.describe RateController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #select" do
    it "returns http success" do
      get :select
      expect(response).to have_http_status(:success)
    end
  end

end
