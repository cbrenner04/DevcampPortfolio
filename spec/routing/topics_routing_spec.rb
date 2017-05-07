# frozen_string_literal: true

require "rails_helper"

RSpec.describe TopicsController, type: :routing do
  describe "routing" do
    it { expect(get: "/topics").to route_to("topics#index") }
    it { expect(get: "/topics/new").to route_to("topics#new") }
    it { expect(get: "/topics/1").to route_to("topics#show", id: "1") }
    it { expect(get: "/topics/1/edit").to route_to("topics#edit", id: "1") }
    it { expect(post: "/topics").to route_to("topics#create") }
    it { expect(put: "/topics/1").to route_to("topics#update", id: "1") }
    it { expect(patch: "/topics/1").to route_to("topics#update", id: "1") }
    it { expect(delete: "/topics/1").to route_to("topics#destroy", id: "1") }
  end
end
