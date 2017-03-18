# frozen_string_literal: true
module Pages
  class Home < SitePrism::Page
    set_url '/'
    element :heading, 'h1'
  end
end
