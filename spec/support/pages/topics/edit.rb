# frozen_string_literal: true
module Pages
  module Topics
    class Edit < SitePrism::Page
      set_url "/topics/{id}/edit"
      element :heading, "h1"
    end
  end
end
