# frozen_string_literal: true

require "rails_helper"

RSpec.describe BlogsController, type: :routing do
  describe "routing" do
    it { expect(get: "/blogs").to route_to("blogs#index") }
    it { expect(get: "/blogs/new").to route_to("blogs#new") }
    it { expect(get: "/blogs/1").to route_to("blogs#show", id: "1") }
    it { expect(get: "/blogs/1/edit").to route_to("blogs#edit", id: "1") }
    it { expect(post: "/blogs").to route_to("blogs#create") }
    it { expect(put: "/blogs/1").to route_to("blogs#update", id: "1") }
    it { expect(patch: "/blogs/1").to route_to("blogs#update", id: "1") }
    it { expect(delete: "/blogs/1").to route_to("blogs#destroy", id: "1") }
  end
end
