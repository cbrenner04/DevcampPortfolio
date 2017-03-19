# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Contact page" do
  let(:contact_page) { Pages::Contact.new }

  background { contact_page.load }

  scenario { expect(contact_page.heading).to have_text "Contact" }
end
