# frozen_string_literal: true

module Pages
  module Portfolios
    class Form < SitePrism::Page
      element :title, "input[name='portfolio[title]']"
      element :subtitle, "input[name='portfolio[subtitle]']"
      element :main_image_button, ".btn", text: "Upload a main image file"
      element :thumb_image_button, ".btn", text: "Upload a thumbnail image file"
      element :body, "textarea[name='portfolio[body]']"
      element :submit, "input[type='submit']"
    end
  end
end
