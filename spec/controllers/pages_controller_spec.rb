require "rails_helper"

RSpec.describe PagesController, type: :controller do
  describe "GET#index" do
    it "レスポンスが200" do
      expect(response.status).to eq 200
    end
  end
end
