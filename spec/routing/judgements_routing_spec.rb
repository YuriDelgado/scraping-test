require "rails_helper"

RSpec.describe JudgementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/judgements").to route_to("judgements#index")
    end

    it "routes to #new" do
      expect(get: "/judgements/new").to route_to("judgements#new")
    end

    it "routes to #show" do
      expect(get: "/judgements/1").to route_to("judgements#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/judgements").to route_to("judgements#create")
    end

    it "routes to #destroy" do
      expect(delete: "/judgements/1").to route_to("judgements#destroy", id: "1")
    end
  end
end
