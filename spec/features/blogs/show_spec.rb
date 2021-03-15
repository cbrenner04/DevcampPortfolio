# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Show blog", type: :feature do
  let(:show_page) { Pages::Blogs::Show.new }
  let(:index_page) { Pages::Blogs::Index.new }
  let!(:blog) { create :blog, status: "draft" }

  context "when an admin is logged in" do
    let(:user) { create :user, roles: "admin" }

    before do
      sign_in user
      show_page.load(id: blog.id)
    end

    it "views and can comment on blog" do
      expect(show_page).to have_heading(text: blog.title)
      expect(show_page).to have_body(text: blog.body)
      expect(show_page).to have_comment_input
    end
  end

  context "when a guest user is logged in" do
    let(:user) { create :user, roles: "user" }
    let!(:published_blog) do
      create :blog, title: "Bar", slug: "bar", status: "published"
    end

    before do
      sign_in user
    end

    it "cannot view a draft blog" do
      show_page.load(id: blog.id)

      expect(show_page).not_to have_heading(text: blog.title)
    end

    it "views and can comment on published blog" do
      show_page.load(id: published_blog.id)

      expect(show_page).to have_heading(text: published_blog.title)
      expect(show_page).to have_body(text: published_blog.body)
      expect(show_page).to have_comment_input
    end
  end

  context "when a non-user visits" do
    let!(:published_blog) do
      create :blog, title: "Bar", slug: "baz", status: "published"
    end

    it "cannot view a draft blog" do
      show_page.load(id: blog.id)

      expect(show_page).not_to have_heading(text: blog.title)
    end

    it "views and cannot comment on blog" do
      show_page.load(id: published_blog.id)

      expect(show_page).to have_heading(text: published_blog.title)
      expect(show_page).to have_body(text: published_blog.body)
      expect(show_page).not_to have_comment_input
    end
  end
end
