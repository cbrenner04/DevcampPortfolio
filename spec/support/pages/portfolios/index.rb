# frozen_string_literal: true
module Pages
  module Portfolios
    class Index < SitePrism::Page
      set_url "/portfolios"
      element :link_to_show, "a"
      element :masthead_heading, "h2", text: "My Portfolio"
      element :link_to_about, "a", text: "Find out more about me"
      element :link_to_blog, "a", text: "My Blog"
    end
  end
end
