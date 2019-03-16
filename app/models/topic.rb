# frozen_string_literal: true

# model for topics relating to blogs
class Topic < ApplicationRecord
  has_many :blogs, dependent: :destroy
  validates :title, presence: true

  def self.with_blogs
    includes(:blogs)
      .left_joins(:blogs)
      .group(:id)
      .order("COUNT(blogs.id) DESC")
      .where
      .not(blogs: { id: nil })
  end
end
