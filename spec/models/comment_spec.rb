# frozen_string_literal: true
require "rails_helper"

RSpec.describe Comment, type: :model do
  before { @comment = create :comment }

  describe "creation" do
    it { expect(@comment).to be_valid }
  end

  describe "validations" do
    it "is invalid when no content" do
      @comment.content = nil

      expect(@comment).to_not be_valid
    end
  end
end
