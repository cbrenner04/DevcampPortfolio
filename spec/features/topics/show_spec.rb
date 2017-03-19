# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Show topic" do
  let(:show_page) { Pages::Topics::Show.new }
  let!(:topic) { create :topic }
  let!(:first_blog) do
    create :blog,
           title: "foo 1",
           slug: "foo 1",
           topic: topic,
           status: "published"
  end
  let!(:second_blog) do
    create :blog,
           title: "foo 2",
           slug: "foo 2",
           topic: topic,
           status: "published"
  end

  context "when an admin is signed in" do
    let(:user) { create :user, roles: "admin" }

    before do
      sign_in user
      show_page.load(id: topic.id)
    end

    scenario "views blogs related to topic" do
      expect(show_page).to have_text first_blog.title
      expect(show_page).to have_text second_blog.title
    end
  end

  context "when a guest user is signed in" do
    let(:user) { create :user, roles: "user" }

    before do
      sign_in user
      show_page.load(id: topic.id)
    end

    scenario "views blogs related to topic" do
      expect(show_page).to have_text first_blog.title
      expect(show_page).to have_text second_blog.title
    end
  end

  context "when no user is signed in" do
    before { show_page.load(id: topic.id) }

    scenario "views blogs related to topic" do
      expect(show_page).to have_text first_blog.title
      expect(show_page).to have_text second_blog.title
    end
  end
end
