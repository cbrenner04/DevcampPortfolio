# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Tweets page", type: :feature do
  let(:tweets_page) { Pages::Tweets.new }

  before { tweets_page.load }

  it { expect(tweets_page.heading).to have_text "Tweets" }
end
