# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Show portfolio" do
  let(:show_page) { Pages::Portfolios::Show.new }
  let(:edit_page) { Pages::Portfolios::Edit.new }
  let(:portfolio) { create :portfolio }

  context "when an admin is logged in" do
    let(:user) { create :user, roles: "admin" }

    before do
      sign_in user
      show_page.load(id: portfolio.id)
    end

    scenario { expect(show_page).to have_heading(text: portfolio.title) }

    scenario "navigates to edit" do
      show_page.link_to_edit.click

      expect(edit_page).to have_text "Edit #{portfolio.title}"
    end
  end

  context "when a guest user is logged in" do
    let(:user) { create :user, roles: "user" }

    before do
      sign_in user
      show_page.load(id: portfolio.id)
    end

    scenario { expect(show_page).to have_heading(text: portfolio.title) }
    scenario { expect(show_page).to_not have_link_to_edit }
  end

  context "when not logged in" do
    before { show_page.load(id: portfolio.id) }

    scenario { expect(show_page).to have_heading(text: portfolio.title) }
    scenario { expect(show_page).to_not have_link_to_edit }
  end
end
