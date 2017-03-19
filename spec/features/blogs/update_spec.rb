# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Edit Blog" do
  let(:blog) { create :blog }
  let(:topic) { create :topic }
  let(:home_page) { Pages::Home.new }
  let(:show_page) { Pages::Blogs::Show.new }
  let(:edit_page) { Pages::Blogs::Edit.new }
  let(:form_page) { Pages::Blogs::Form.new }

  context "when admin signed in" do
    let(:user) { create :user, roles: "admin" }

    before do
      sign_in user
      edit_page.load(id: blog.id)
    end

    scenario "updates blog successfully" do
      form_page.title.set "Updated Foo"
      form_page.topic.select topic.title
      form_page.publish.click
      form_page.body.set "Bar"
      form_page.submit.click

      expect(show_page).to have_heading(text: "Updated Foo")
    end
  end

  context "when guest user signed in" do
    let(:user) { create :user, roles: "user" }

    before do
      sign_in user
      edit_page.load(id: blog.id)
    end

    scenario "cannot access edit page" do
      expect(home_page.heading).to have_text "Welcome to my portfolio site"
    end
  end

  context "when no one signed in" do
    before { edit_page.load(id: blog.id) }

    scenario "cannot access edit page" do
      expect(home_page.heading).to have_text "Welcome to my portfolio site"
    end
  end
end
