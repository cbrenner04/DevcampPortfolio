# frozen_string_literal: true

module Pages
  class About < SitePrism::Page
    set_url "/about"
    element :heading, "h1"
  end
end
