# frozen_string_literal: true

require "rails_helper"

RSpec.describe Technology, type: :model do
  let(:technology) { create :technology }

  describe "validation" do
    it { expect(technology).to be_valid }
  end
end
