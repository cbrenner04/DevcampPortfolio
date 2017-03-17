# frozen_string_literal: true
# no doc
class Topic < ApplicationRecord
  has_many :blogs
  validates :title, presence: true

  def self.with_blogs
    includes(:blogs).where.not(blogs: { id: nil })
  end
end
