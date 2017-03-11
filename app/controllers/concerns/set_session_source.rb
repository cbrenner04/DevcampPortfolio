# frozen_string_literal: true
# functionality for setting the session source based on query in url
module SetSessionSource
  extend ActiveSupport::Concern

  included do
    before_action :set_source
  end

  def set_source
    session[:source] = params[:q] if params[:q]
  end
end
