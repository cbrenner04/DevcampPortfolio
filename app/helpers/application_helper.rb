# frozen_string_literal: true
# no doc
module ApplicationHelper
  def login_helper
    if current_user.is_a? User
      link_to 'Logout', destroy_user_session_path, method: :delete
    else
      (link_to 'Register', new_user_registration_path) +
        (link_to 'Login', new_user_session_path)
    end
  end

  def session_helper
    return unless session[:source]
    greeting = "Thanks for visiting from #{session[:source]}"
    content_tag(:p, greeting, class: 'source-greeting')
  end
end
