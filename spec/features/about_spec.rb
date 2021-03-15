# frozen_string_literal: true

require "rails_helper"

RSpec.describe "About page", type: :feature do
  let(:about_page) { Pages::About.new }

  before { about_page.load }

  it { expect(about_page.heading).to have_text "About me" }
end
