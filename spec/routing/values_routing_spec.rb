require "rails_helper"

RSpec.describe ValuesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/values").to route_to("values#index")
    end

    it "routes to #new" do
      expect(:get => "/values/new").to route_to("values#new")
    end

    it "routes to #show" do
      expect(:get => "/values/1").to route_to("values#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/values/1/edit").to route_to("values#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/values").to route_to("values#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/values/1").to route_to("values#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/values/1").to route_to("values#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/values/1").to route_to("values#destroy", :id => "1")
    end

  end
end
