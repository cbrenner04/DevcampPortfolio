# frozen_string_literal: true
require "rails_helper"

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

  describe ".descending" do
    before { Skill.destroy_all }

    it "returns records in descending order" do
      most_skill = create :skill, percent_utilized: 50
      least_skill = create :skill, percent_utilized: 20

      expect(Skill.descending).to eq [most_skill, least_skill]
    end
  end
end
