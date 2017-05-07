# frozen_string_literal: true

require "rails_helper"

RSpec.describe Portfolio, type: :model do
  let(:portfolio) { create :portfolio }

  describe "validations" do
    it { expect(portfolio).to be_valid }

    describe "with no title" do
      before { portfolio.title = nil }

      it { expect(portfolio).to be_invalid }
    end

    describe "with no body" do
      before { portfolio.body = nil }

      it { expect(portfolio).to be_invalid }
    end
  end

  describe ".by_position" do
    let!(:portfolio1) { create :portfolio, position: 1 }
    let!(:portfolio2) { create :portfolio, position: 2 }

    it { expect(Portfolio.by_position).to eq [portfolio1, portfolio2] }
  end
end
