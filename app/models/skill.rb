# frozen_string_literal: true
# no doc
class Skill < ApplicationRecord
  validates :title, :percent_utilized, presence: true
end
