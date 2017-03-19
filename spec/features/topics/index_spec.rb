# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Topics" do
  let(:index_page) { Pages::Topics::Index.new }
  let(:topic) { create :topic }
  before do
    2.times do |i|
      create :blog,
             title: "foo #{i}",
             slug: "foo #{i}",
             topic: topic,
             status: "published"
    end

    2.times do |i|
      create :blog,
             title: "bar #{i}",
             slug: "bar #{i}",
             topic: topic,
             status: "draft"
    end
  end

  context "when an admin is signed in" do
    let(:user) { create :user, roles: "admin" }

    before do
      sign_in user
      index_page.load
    end

    scenario "views topics with count of related, published blogs" do
      expect(index_page).to have_text "#{topic.title} 2"
    end
  end

  context "when a guest user is signed in" do
    let(:user) { create :user, roles: "user" }

    before do
      sign_in user
      index_page.load
    end

    scenario "views topics with count of related, published blogs" do
      expect(index_page).to have_text "#{topic.title} 2"
    end
  end

  context "when no user is signed in" do
    before { index_page.load }

    scenario "views topics with count of related, published blogs" do
      expect(index_page).to have_text "#{topic.title} 2"
    end
  end
end
