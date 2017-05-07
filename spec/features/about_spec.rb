# frozen_string_literal: true

require "rails_helper"

RSpec.feature "About page" do
  let(:about_page) { Pages::About.new }

  background { about_page.load }

  scenario { expect(about_page.heading).to have_text "About me" }
end
