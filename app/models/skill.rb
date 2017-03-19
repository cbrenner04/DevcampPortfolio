# frozen_string_literal: true
# TODO: no doc
class Skill < ApplicationRecord
  validates :title, :percent_utilized, presence: true

  def self.descending
    order(percent_utilized: :desc)
  end
end
