# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Skill, type: :model do
  before { @skill = create :skill }

  describe "creation" do
    it { expect(@skill).to be_valid }
  end

  describe "validations" do
    it "is invalid when no title" do
      @skill.title = nil

      expect(@skill).to_not be_valid
    end

    it "is invalid when no percent_utilized" do
      @skill.percent_utilized = nil

      expect(@skill).to_not be_valid
    end
  end
end
