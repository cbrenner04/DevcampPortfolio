# frozen_string_literal: true

module Pages
  module Portfolios
    class Show < SitePrism::Page
      set_url "/portfolios/{id}"
      element :heading, "h1"
      element :link_to_edit, "a", text: "Edit Item"
    end
  end
end
