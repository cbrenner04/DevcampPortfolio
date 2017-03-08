# frozen_string_literal: true
# no doc
class Portfolio < ApplicationRecord
  after_initialize :set_defaults

  validates :title, :body, :main_image, :thumb_image, presence: true

  def set_defaults
    self.main_image ||= 'https://placeholdit.imgix.net/~text?txtsize=33&txt=' \
                        '600%C3%97400&w=600&h=400'
    self.thumb_image ||= 'https://placeholdit.imgix.net/~text?txtsize=33&txt=' \
                         '350%C3%97200&w=350&h=200'
  end
end
