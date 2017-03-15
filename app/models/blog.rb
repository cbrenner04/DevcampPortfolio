# frozen_string_literal: true
# no doc
class Blog < ApplicationRecord
  extend FriendlyId

  belongs_to :topic

  has_many :comments, dependent: :destroy

  enum status: { draft: 0, published: 1 }

  friendly_id :title, use: :slugged

  validates :title, :body, presence: true
end
