# frozen_string_literal: true

module Pages
  module Topics
    class Form < SitePrism::Page
      element :title, "input[name='topic[title]']"
      element :submit, "input[type='submit']"
    end
  end
end
