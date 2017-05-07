# frozen_string_literal: true
require "rails_helper"

RSpec.describe PortfoliosController, type: :routing do
  describe "routing" do
    it { expect(get: "/portfolios").to route_to("portfolios#index") }
    it { expect(get: "/portfolios/new").to route_to("portfolios#new") }
    it { expect(post: "/portfolios").to route_to("portfolios#create") }
    it { expect(put: "/portfolios/sort").to route_to("portfolios#sort") }
    it { expect(get: "/portfolios/1").to route_to("portfolios#show", id: "1") }

    it do
      expect(get: "/portfolios/1/edit").to route_to("portfolios#edit", id: "1")
    end

    it do
      expect(put: "/portfolios/1").to route_to("portfolios#update", id: "1")
    end

    it do
      expect(patch: "/portfolios/1").to route_to("portfolios#update", id: "1")
    end

    it do
      expect(delete: "/portfolios/1").to route_to("portfolios#destroy", id: "1")
    end
  end
end
