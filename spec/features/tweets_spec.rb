# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Tweets page" do
  let(:tweets_page) { Pages::Tweets.new }

  background { tweets_page.load }

  scenario "visits" do
    expect(tweets_page.heading).to have_text "Tweets"
  end
end
