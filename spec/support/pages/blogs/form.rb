# frozen_string_literal: true

module Pages
  module Blogs
    class Form < SitePrism::Page
      element :title, "input[name='blog[title]']"
      element :topic, "select[name='blog[topic_id]']"
      element :publish, "input[value='published']"
      element :body, "textarea[name='blog[body]']"
      element :submit, "input[type='submit']"
    end
  end
end
