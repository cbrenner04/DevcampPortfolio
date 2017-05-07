# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Blogs index" do
  let(:index_page) { Pages::Blogs::Index.new }
  let!(:blog) { create :blog }

  describe "admin user" do
    let(:user) { create :user, roles: "admin" }

    before do
      sign_in user
      index_page.load
    end

    scenario { expect(index_page).to have_status_icon }
    scenario { expect(index_page).to have_edit_icon }
    scenario { expect(index_page).to have_delete_icon }

    scenario "navigates to new form" do
      index_page.new_link.click

      expect(current_path).to eq new_blog_path
    end

    scenario "navigates to show" do
      click_on blog.title

      expect(current_path).to eq blog_path(blog)
    end

    scenario "navigates to topics" do
      index_page.topics.click

      expect(current_path).to eq topics_path
    end

    scenario "can navigate to topics with blog posts" do
      click_on blog.topic.title

      expect(current_path).to eq topic_path(blog.topic)
    end
  end

  describe "regular user" do
    let(:user) { create :user, roles: "" }

    before do
      blog.update!(status: "published")
      sign_in user
      index_page.load
    end

    scenario { expect(index_page).to_not have_new_link }
    scenario { expect(index_page).to_not have_status_icon }
    scenario { expect(index_page).to_not have_edit_icon }
    scenario { expect(index_page).to_not have_delete_icon }

    scenario "navigates to show" do
      click_on blog.title

      expect(current_path).to eq blog_path(blog)
    end

    scenario "navigates to topics" do
      index_page.topics.click

      expect(current_path).to eq topics_path
    end

    scenario "can navigate to topics with blog posts" do
      click_on blog.topic.title

      expect(current_path).to eq topic_path(blog.topic)
    end
  end

  describe "guest user" do
    before do
      blog.update!(status: "published")
      index_page.load
    end

    scenario { expect(index_page).to_not have_new_link }
    scenario { expect(index_page).to_not have_status_icon }
    scenario { expect(index_page).to_not have_edit_icon }
    scenario { expect(index_page).to_not have_delete_icon }

    scenario "navigates to show" do
      click_on blog.title

      expect(current_path).to eq blog_path(blog)
    end

    scenario "navigates to topics" do
      index_page.topics.click

      expect(current_path).to eq topics_path
    end

    scenario "can navigate to topics with blog posts" do
      click_on blog.topic.title

      expect(current_path).to eq topic_path(blog.topic)
    end
  end
end
