# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Topic, type: :model do
  before { @topic = create :topic }

  describe "creation" do
    it { expect(@topic).to be_valid }
  end

  describe "validations" do
    it "is invalid when no title" do
      @topic.title = nil

      expect(@topic).to_not be_valid
    end
  end
end
