# frozen_string_literal: true
# no doc
class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSessionSource
  protect_from_forgery with: :exception
end
