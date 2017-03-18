# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Create blog" do
  context "when an admin is logged in" do
    let(:user) { create :user, roles: "admin" }

    before do
      sign_in user
      visit new_blog_path
    end

    scenario "creates a draft blog successfully"
    scenario "creates a published blog successfully"
  end

  context "when a non admin is logged in" do
    let(:user) { create :user, roles: nil }

    before do
      sign_in user
      visit new_blog_path
    end

    scenario "cannot access new page"
  end

  context "when no one is logged in" do
    before { visit new_blog_path }

    scenario "cannot access new page"
  end
end
