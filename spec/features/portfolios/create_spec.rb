# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Create portfolio" do
  let(:new_page) { Pages::Portfolios::New.new }
  let(:form_page) { Pages::Portfolios::Form.new }
  let(:index_page) { Pages::Portfolios::Index.new }
  let(:home_page) { Pages::Home.new }

  context "when an admin is logged in" do
    let(:user) { create :user, roles: "admin" }

    before do
      sign_in user
      new_page.load
    end

    scenario "creates a new portfolio" do
      form_page.title.set "New portfolio"
      form_page.subtitle.set "Foo"
      expect(form_page).to have_main_image_button
      expect(form_page).to have_thumb_image_button
      form_page.body.set "Bar"
      form_page.submit.click

      expect(index_page).to have_link_to_show(text: "New portfolio")
    end
  end

  context "when a non admin is logged in" do
    let(:user) { create :user, roles: "user" }

    before do
      sign_in user
      new_page.load
    end

    scenario "cannot access new page" do
      expect(home_page.heading).to have_text "Welcome to my portfolio site"
    end
  end

  context "when no one is logged in" do
    before { new_page.load }

    scenario "cannot access new page" do
      expect(home_page.heading).to have_text "Welcome to my portfolio site"
    end
  end
end
