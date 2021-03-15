# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Home page", type: :feature do
  let(:home_page) { Pages::Home.new }

  before { home_page.load }

  it "visits" do
    expect(home_page.heading).to have_text "Welcome to my portfolio site"
  end

  it "navigates to the about page" do
    home_page.about_button.click

    expect(page).to have_current_path about_path, ignore_query: true
  end
end
