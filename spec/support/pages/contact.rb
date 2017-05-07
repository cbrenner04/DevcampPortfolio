# frozen_string_literal: true

module Pages
  class Contact < SitePrism::Page
    set_url "/contact"
    element :heading, "h1"
  end
end
