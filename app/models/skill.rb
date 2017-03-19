# frozen_string_literal: true
# model for skills which is represented on the about page
class Skill < ApplicationRecord
  validates :title, :percent_utilized, presence: true

  def self.descending
    order(percent_utilized: :desc)
  end
end
