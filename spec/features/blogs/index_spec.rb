# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Blogs index", type: :feature do
  let(:index_page) { Pages::Blogs::Index.new }
  let!(:blog) { create :blog }

  describe "admin user" do
    let(:user) { create :user, roles: "admin" }

    before do
      sign_in user
      index_page.load
    end

    it { expect(index_page).to have_status_icon }
    it { expect(index_page).to have_edit_icon }
    it { expect(index_page).to have_delete_icon }

    it "navigates to new form" do
      index_page.new_link.click

      expect(page).to have_current_path new_blog_path, ignore_query: true
    end

    it "navigates to show" do
      click_on blog.title

      expect(page).to have_current_path blog_path(blog), ignore_query: true
    end

    it "navigates to topics" do
      index_page.topics.click

      expect(page).to have_current_path topics_path, ignore_query: true
    end

    it "can navigate to topics with blog posts" do
      click_on blog.topic.title

      expect(page).to have_current_path topic_path(blog.topic), ignore_query: true
    end
  end

  describe "regular user" do
    let(:user) { create :user, roles: "" }

    before do
      blog.update!(status: "published")
      sign_in user
      index_page.load
    end

    it { expect(index_page).not_to have_new_link }
    it { expect(index_page).not_to have_status_icon }
    it { expect(index_page).not_to have_edit_icon }
    it { expect(index_page).not_to have_delete_icon }

    it "navigates to show" do
      click_on blog.title

      expect(page).to have_current_path blog_path(blog), ignore_query: true
    end

    it "navigates to topics" do
      index_page.topics.click

      expect(page).to have_current_path topics_path, ignore_query: true
    end

    it "can navigate to topics with blog posts" do
      click_on blog.topic.title

      expect(page).to have_current_path topic_path(blog.topic), ignore_query: true
    end
  end

  describe "guest user" do
    before do
      blog.update!(status: "published")
      index_page.load
    end

    it { expect(index_page).not_to have_new_link }
    it { expect(index_page).not_to have_status_icon }
    it { expect(index_page).not_to have_edit_icon }
    it { expect(index_page).not_to have_delete_icon }

    it "navigates to show" do
      click_on blog.title

      expect(page).to have_current_path blog_path(blog), ignore_query: true
    end

    it "navigates to topics" do
      index_page.topics.click

      expect(page).to have_current_path topics_path, ignore_query: true
    end

    it "can navigate to topics with blog posts" do
      click_on blog.topic.title

      expect(page).to have_current_path topic_path(blog.topic), ignore_query: true
    end
  end
end
