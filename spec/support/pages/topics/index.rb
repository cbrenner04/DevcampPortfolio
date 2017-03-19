# frozen_string_literal: true
module Pages
  module Topics
    class Index < SitePrism::Page
      set_url "/topics"
      element :list_item, ".list-group-item"
    end
  end
end
