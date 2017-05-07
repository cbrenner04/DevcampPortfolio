# frozen_string_literal: true
require "rails_helper"

RSpec.describe Skill, type: :model do
  let(:skill) { create :skill }

  describe "validations" do
    it { expect(skill).to be_valid }

    describe "with no title" do
      before { skill.title = nil }

      it { expect(skill).to be_invalid }
    end

    describe "with no percent_utilized" do
      before { skill.percent_utilized = nil }

      it { expect(skill).to be_invalid }
    end
  end

  describe ".descending" do
    let!(:most_skill) { create :skill, percent_utilized: 50 }
    let!(:least_skill) { create :skill, percent_utilized: 20 }

    it { expect(Skill.descending).to eq [most_skill, least_skill] }
  end
end
