require "spec_helper"

describe IncidentsController do
  describe "routing" do

    it "routes to #index" do
      get("/incidents").should route_to("incidents#index")
    end

    it "routes to #new" do
      get("/incidents/new").should route_to("incidents#new")
    end

    it "routes to #show" do
      get("/incidents/1").should route_to("incidents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/incidents/1/edit").should route_to("incidents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/incidents").should route_to("incidents#create")
    end

    it "routes to #update" do
      put("/incidents/1").should route_to("incidents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/incidents/1").should route_to("incidents#destroy", :id => "1")
    end

  end
end
