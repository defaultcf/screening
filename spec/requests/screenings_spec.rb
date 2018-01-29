require "rails_helper"

RSpec.describe "Screenings", type: :request do
  describe "GET /screenings" do
    it "works! (now write some real specs)" do
      get screenings_path
      expect(response).to have_http_status(200)
    end
  end
end
