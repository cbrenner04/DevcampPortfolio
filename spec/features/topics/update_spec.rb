# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Create topic" do
  let(:topic) { create :topic }
  let(:home_page) { Pages::Home.new }
  let(:edit_page) { Pages::Topics::New.new }
  let(:form_page) { Pages::Topics::Form.new }
  let(:index_page) { Pages::Topics::Index.new }

  context "when an admin is logged in" do
    let(:user) { create :user, roles: "admin" }

    before do
      sign_in user
      edit_page.load(id: topic.id)
    end

    scenario "creates a edit topic" do
      form_page.title.set "foo"
      form_page.submit.click

      expect(index_page).to have_text "foo 0"
    end
  end

  context "when a guest user is logged in" do
    let(:user) { create :user, roles: "user" }

    before do
      sign_in user
      edit_page.load(id: topic.id)
    end

    scenario "cannot access edit topic page" do
      expect(home_page.heading).to have_text "Welcome to my portfolio site"
    end
  end

  context "when no one is logged in" do
    before { edit_page.load(id: topic.id) }

    scenario "cannot access edit topic page" do
      expect(home_page.heading).to have_text "Welcome to my portfolio site"
    end
  end
end
