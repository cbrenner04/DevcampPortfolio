# frozen_string_literal: true

module Pages
  module Blogs
    class Index < SitePrism::Page
      set_url "/blogs"
      element :heading, "h2"
      element :new_link, "a", text: "New Blog"
      element :status_icon, ".fa-file-text"
      element :edit_icon, ".fa-pencil-square-o"
      element :delete_icon, ".fa-trash"
      element :topics, "a", text: "Topics"
    end
  end
end
