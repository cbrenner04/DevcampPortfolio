# frozen_string_literal: true
# no doc
class Skill < ApplicationRecord
  include Placeholder

  after_initialize :set_defaults

  validates :title, :percent_utilized, presence: true

  def set_defaults
    self.badge ||= Placeholder.image_generator(height: 250, width: 250)
  end
end
