# frozen_string_literal: true

require "rails_helper"

RSpec.describe AboutsController, type: :routing do
  describe "routing" do
    it { expect(get: "/about").to route_to("abouts#show") }
  end
end
