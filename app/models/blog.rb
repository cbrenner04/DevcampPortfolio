# frozen_string_literal: true
# TODO: no doc
class Blog < ApplicationRecord
  extend FriendlyId

  belongs_to :topic

  has_many :comments, dependent: :destroy

  enum status: { draft: 0, published: 1 }

  friendly_id :title, use: :slugged

  validates :title, :body, :topic_id, presence: true

  def self.descending
    order(created_at: :desc)
  end
end
