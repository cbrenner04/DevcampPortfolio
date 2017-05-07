# frozen_string_literal: true
# model for blogs
class Blog < ApplicationRecord
  extend FriendlyId

  belongs_to :topic

  has_many :comments, dependent: :destroy

  enum status: { draft: 0, published: 1 }

  friendly_id :title, use: :slugged

  validates :title, :body, :topic, presence: true

  def self.descending
    order(created_at: :desc)
  end
end
