# frozen_string_literal: true
require "rails_helper"

RSpec.describe Blog, type: :model do
  before { @blog = create :blog }

  describe "creation" do
    it { expect(@blog).to be_valid }
  end

  describe "validations" do
    it "is invalid when no title" do
      @blog.title = nil

      expect(@blog).to_not be_valid
    end

    it "is invalid when no body" do
      @blog.body = nil

      expect(@blog).to_not be_valid
    end
  end
end
