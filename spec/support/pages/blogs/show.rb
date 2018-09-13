# frozen_string_literal: true

module Pages
  module Blogs
    class Show < SitePrism::Page
      set_url "/blogs/{id}"
      element :heading, "h2"
      element :body, "p"
      element :comment_input, "textarea[name='comment[content]']"
      element :submit, "input[type='submit']"
      element :comment, ".comment-card.card.card-body"
    end
  end
end
