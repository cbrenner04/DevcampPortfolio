# frozen_string_literal: true
# no doc
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSessionSource
  include CurrentUserConcern
end
