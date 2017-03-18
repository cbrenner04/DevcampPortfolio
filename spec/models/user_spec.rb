# frozen_string_literal: true
require "rails_helper"

RSpec.describe User, type: :model do
  before { @user = create :user }

  describe "creation" do
    it { expect(@user).to be_valid }
  end

  describe "validations" do
    it "is invalid when no name" do
      @user.name = nil

      expect(@user).to_not be_valid
    end
  end

  describe "#first_name" do
    it "returns first name" do
      user = create :user, name: "foo bar"

      expect(user.first_name).to eq "foo"
    end
  end

  describe "#last_name" do
    it "returns last name" do
      user = create :user, name: "foo bar"

      expect(user.last_name).to eq "bar"
    end
  end
end
