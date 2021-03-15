# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Contact page", type: :feature do
  let(:contact_page) { Pages::Contact.new }

  before { contact_page.load }

  it { expect(contact_page.heading).to have_text "Contact" }
end
