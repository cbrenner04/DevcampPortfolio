# frozen_string_literal: true
# controller superclass
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSessionSource
  include CurrentUserConcern
  include DefaultPageContent
  include CopyrightContent
end
