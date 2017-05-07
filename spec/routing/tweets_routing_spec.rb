# frozen_string_literal: true
require "rails_helper"

RSpec.describe TweetsController, type: :routing do
  describe "routing" do
    it { expect(get: "/tweets").to route_to("tweets#index") }
  end
end
