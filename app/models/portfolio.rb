# frozen_string_literal: true
# no doc
class Portfolio < ApplicationRecord
  include Placeholder

  has_many :technologies

  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs|
                                  attrs['name'].blank?
                                }

  after_initialize :set_defaults

  validates :title, :body, :main_image, :thumb_image, presence: true

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: 400, width: 600)
    self.thumb_image ||= Placeholder.image_generator(height: 200, width: 350)
  end
end
