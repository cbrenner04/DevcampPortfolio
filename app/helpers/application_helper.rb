# frozen_string_literal: true
# no doc
module ApplicationHelper
  def login_helper(style = '')
    if current_user.is_a? GuestUser
      link_to('Register', new_user_registration_path, class: style) + ' ' +
        link_to('Login', new_user_session_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    end
  end

  def session_helper
    return unless session[:source]
    greeting = "Thanks for visiting from #{session[:source]}"
    content_tag(:p, greeting, class: 'source-greeting')
  end

  def nav_items
    [
      { url: root_path, title: 'Home' },
      { url: about_path, title: 'About Me' },
      { url: contact_path, title: 'Contact' },
      { url: portfolios_path, title: 'Portfolio' },
      { url: blogs_path, title: 'Blog' },
      { url: tweets_path, title: 'Tweets' }
    ]
  end

  def nav_helper(style, tag_type)
    nav_links = ''
    nav_items.each do |item|
      nav_links += "<#{tag_type}><a href='#{item[:url]}' class='#{style} " \
                   "#{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active?(path)
    'active' if current_page? path
  end

  def alerts
    alert = flash[:alert] || flash[:error] || flash[:notice]

    alert_generator(alert) if alert
  end

  def alert_generator(message)
    js add_gritter message,
                   title: 'Christopher Brenner Portfolio', sticky: false
  end
end
