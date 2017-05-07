# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Portfolios" do
  let(:index_page) { Pages::Portfolios::Index.new }
  let(:show_page) { Pages::Portfolios::Show.new }
  let(:blog_index_page) { Pages::Blogs::Index.new }
  let(:about_page) { Pages::About.new }
  let!(:portfolio) { create :portfolio }

  context "when an admin is logged in" do
    let(:user) { create :user, roles: "admin" }

    before do
      sign_in user
      index_page.load
    end

    scenario { expect(index_page).to_not have_masthead_heading }

    scenario "navigates to show" do
      index_page.link_to_show(text: portfolio.title).click

      expect(show_page.heading).to have_text portfolio.title
    end
  end

  context "when a guest user is logged in" do
    let(:user) { create :user, roles: "user" }

    before do
      sign_in user
      index_page.load
    end

    scenario { expect(index_page).to have_masthead_heading }

    scenario "navigates to about page" do
      index_page.link_to_about.click

      expect(about_page.heading).to have_text "About me"
    end

    scenario "navigates to blog" do
      index_page.link_to_blog.click

      expect(blog_index_page.heading).to have_text "Chris's Blog"
    end

    scenario "navigates to show" do
      index_page.link_to_show(text: portfolio.title).click

      expect(show_page.heading).to have_text portfolio.title
    end
  end

  context "when not logged in" do
    before { index_page.load }

    scenario { expect(index_page).to have_masthead_heading }

    scenario "navigates to about page" do
      index_page.link_to_about.click

      expect(about_page.heading).to have_text "About me"
    end

    scenario "navigates to blog" do
      index_page.link_to_blog.click

      expect(blog_index_page.heading).to have_text "Chris's Blog"
    end

    scenario "navigates to show" do
      index_page.link_to_show(text: portfolio.title).click

      expect(show_page.heading).to have_text portfolio.title
    end
  end
end
