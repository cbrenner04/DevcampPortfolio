# frozen_string_literal: true
# no doc
class Topic < ApplicationRecord
  has_many :blogs
  validates :title, presence: true
end
