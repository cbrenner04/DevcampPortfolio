# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Show portfolio", type: :feature do
  let(:show_page) { Pages::Portfolios::Show.new }
  let(:edit_page) { Pages::Portfolios::Edit.new }
  let(:portfolio) { create :portfolio }

  context "when an admin is logged in" do
    let(:user) { create :user, roles: "admin" }

    before do
      sign_in user
      show_page.load(id: portfolio.id)
    end

    it { expect(show_page).to have_heading(text: portfolio.title) }

    it "navigates to edit" do
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

    it { expect(show_page).to have_heading(text: portfolio.title) }
    it { expect(show_page).not_to have_link_to_edit }
  end

  context "when not logged in" do
    before { show_page.load(id: portfolio.id) }

    it { expect(show_page).to have_heading(text: portfolio.title) }
    it { expect(show_page).not_to have_link_to_edit }
  end
end
