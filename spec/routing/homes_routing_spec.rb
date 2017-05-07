# frozen_string_literal: true
require "rails_helper"

RSpec.describe HomesController, type: :routing do
  describe "routing" do
    it { expect(get: "/home").to route_to("homes#show") }
  end
end
