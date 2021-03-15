# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { create :user, name: "foo bar" }

  describe "validations" do
    it { expect(user).to be_valid }

    describe "with no name" do
      before { user.name = nil }

      it { expect(user).not_to be_valid }
    end
  end

  describe "#first_name" do
    it { expect(user.first_name).to eq "foo" }
  end

  describe "#last_name" do
    it { expect(user.last_name).to eq "bar" }
  end
end
