# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Home page" do
  let(:home_page) { Pages::Home.new }

  background { home_page.load }

  scenario "visits" do
    expect(home_page.heading).to have_text "Welcome to my portfolio site"
  end
end
