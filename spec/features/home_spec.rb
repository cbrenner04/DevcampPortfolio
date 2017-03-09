# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Home page" do
  let(:home_page) { Pages::Home.new }

  background { home_page.load }

  scenario "visits" do
    save_and_open_page
    expect(home_page.heading).to have_text "Home page"
  end

  scenario "sees blog posts"
  scenario "sees skills"
end
