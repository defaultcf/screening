require "rails_helper"

RSpec.describe ScreeningsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/screenings").to route_to("screenings#index")
    end

    it "routes to #new" do
      expect(get: "/screenings/new").to route_to("screenings#new")
    end

    it "routes to #show" do
      expect(get: "/screenings/1").to route_to("screenings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/screenings/1/edit").to route_to("screenings#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/screenings").to route_to("screenings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/screenings/1").to route_to("screenings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/screenings/1").to route_to("screenings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/screenings/1").to route_to("screenings#destroy", id: "1")
    end
  end
end
