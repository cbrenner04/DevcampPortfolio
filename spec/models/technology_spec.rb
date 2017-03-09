# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Technology, type: :model do
  before { @technology = create :technology }

  describe "creation" do
    it { expect(@technology).to be_valid }
  end
end
