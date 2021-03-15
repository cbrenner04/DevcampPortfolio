# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Create blog", type: :feature do
  let(:home_page) { Pages::Home.new }
  let(:new_page) { Pages::Blogs::New.new }
  let(:form_page) { Pages::Blogs::Form.new }
  let(:show_page) { Pages::Blogs::Show.new }
  let!(:topic) { create :topic }

  context "when an admin is logged in" do
    let(:user) { create :user, roles: "admin" }

    before do
      sign_in user
      new_page.load
    end

    it "creates blog successfully" do
      form_page.title.set "Foo"
      form_page.topic.select topic.title
      form_page.publish.click
      form_page.body.set "Bar"
      form_page.submit.click

      expect(show_page).to have_heading(text: "Foo")
    end
  end

  context "when a non admin is logged in" do
    let(:user) { create :user, roles: "" }

    before do
      sign_in user
      new_page.load
    end

    it "cannot access new page" do
      expect(home_page.heading).to have_text "Welcome to my portfolio site"
    end
  end

  context "when no one is logged in" do
    before { new_page.load }

    it "cannot access new page" do
      expect(home_page.heading).to have_text "Welcome to my portfolio site"
    end
  end
end
