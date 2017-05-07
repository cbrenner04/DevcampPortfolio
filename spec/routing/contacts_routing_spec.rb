# frozen_string_literal: true

require "rails_helper"

RSpec.describe ContactsController, type: :routing do
  describe "routing" do
    it { expect(get: "/contact").to route_to("contacts#show") }
  end
end
