# frozen_string_literal: true

# Sets the copyright for displaying
module CopyrightContent
  extend ActiveSupport::Concern

  included do
    before_action :set_copyright
  end

  def set_copyright
    @copyright = copyright("Christopher Brenner", "All rights reserved")
  end

  def copyright(name, message)
    "&copy; #{Time.zone.now.year} | <b>#{name}</b> #{message}".html_safe
  end
end
