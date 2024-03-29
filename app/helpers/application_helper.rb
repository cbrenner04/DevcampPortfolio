# frozen_string_literal: true

# helpers for application views
module ApplicationHelper
  def login_helper(style = "")
    if current_user.is_a? GuestUser
      "#{link_to('Register', new_user_registration_path,
                 class: style)} #{link_to('Login', new_user_session_path, class: style)}".html_safe
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def nav_items
    [
      { url: root_path, title: "Home" },
      { url: about_path, title: "About Me" },
      { url: contact_path, title: "Contact" },
      { url: portfolios_path, title: "Portfolio" },
      { url: blogs_path, title: "Blog" },
    ]
  end

  def nav_helper(style, tag_type)
    nav_links = ""
    nav_items.each do |item|
      nav_links += "<#{tag_type}><a href='#{item[:url]}' class='#{style} " \
                   "#{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active?(path)
    "active" if current_page? path
  end

  def alerts
    alert = flash[:alert] || flash[:error] || flash[:notice]

    alert_generator(alert) if alert
  end

  def alert_generator(message)
    js add_gritter message,
                   title: "Christopher Brenner Portfolio",
                   sticky: false,
                   time: 2000
  end
end
