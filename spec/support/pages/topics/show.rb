# frozen_string_literal: true

module Pages
  module Topics
    class Show < SitePrism::Page
      set_url "/topics/{id}"
      element :edit_link, "a", text: "Edit"
      element :destroy_link, "a", text: "Delete"
    end
  end
end
