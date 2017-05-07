# frozen_string_literal: true
require "rails_helper"

RSpec.describe ToggleStatusesController, type: :routing do
  let(:blog) { create :blog }

  describe "routing" do
    it do
      expect(get: "/blogs/#{blog.to_param}/toggle_status")
        .to route_to("toggle_statuses#show", blog_id: blog.to_param)
    end
  end
end
