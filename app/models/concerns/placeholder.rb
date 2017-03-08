# frozen_string_literal: true
# logic for creating placeholder data for models
module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(height:, width:)
    "https://placeholdit.imgix.net/~text?txtsize=33&txt=#{width}%C3%97" \
    "#{height}&w=#{width}&h=#{height}"
  end
end
