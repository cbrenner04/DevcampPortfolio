# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Show topic", type: :feature do
  let(:show_page) { Pages::Topics::Show.new }
  let(:edit_page) { Pages::Topics::Edit.new }
  let(:index_page) { Pages::Topics::Index.new }
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

    it "views blogs related to topic" do
      expect(show_page).to have_text first_blog.title
      expect(show_page).to have_text second_blog.title
    end

    it "can edit topic" do
      show_page.edit_link.click

      expect(edit_page).to have_heading(text: "Edit #{topic.title}")
    end

    it "can destroy topic" do
      topic = create :topic, title: "new topic"
      show_page.load(id: topic.id)
      show_page.destroy_link.click

      expect(index_page).not_to have_list_item(text: topic.title)
    end
  end

  context "when a guest user is signed in" do
    let(:user) { create :user, roles: "user" }

    before do
      sign_in user
      show_page.load(id: topic.id)
    end

    it "views blogs related to topic" do
      expect(show_page).to have_text first_blog.title
      expect(show_page).to have_text second_blog.title
    end

    it "cannot edit topic" do
      expect(show_page).not_to have_edit_link
    end

    it "cannot destroy topic" do
      expect(show_page).not_to have_destroy_link
    end
  end

  context "when no user is signed in" do
    before { show_page.load(id: topic.id) }

    it "views blogs related to topic" do
      expect(show_page).to have_text first_blog.title
      expect(show_page).to have_text second_blog.title
    end

    it "cannot edit topic" do
      expect(show_page).not_to have_edit_link
    end

    it "cannot destroy topic" do
      expect(show_page).not_to have_destroy_link
    end
  end
end
