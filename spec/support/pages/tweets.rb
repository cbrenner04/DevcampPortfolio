# frozen_string_literal: true

module Pages
  class Tweets < SitePrism::Page
    set_url "/tweets"
    element :heading, "h1"
  end
end
