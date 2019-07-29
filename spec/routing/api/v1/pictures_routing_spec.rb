require "rails_helper"

RSpec.describe Api::V1::PicturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/v1/pictures").to route_to("api/v1/pictures#index")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/pictures/1").to route_to("api/v1/pictures#show", :id => "1")
    end


    it "routes to #new" do
      expect(:post => "/api/v1/pictures").to route_to("api/v1/pictures#new")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/pictures/1").to route_to("api/v1/pictures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/pictures/1").to route_to("api/v1/pictures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/pictures/1").to route_to("api/v1/pictures#destroy", :id => "1")
    end
  end
end
