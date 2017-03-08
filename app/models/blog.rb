# frozen_string_literal: true
# no doc
class Blog < ApplicationRecord
  extend FriendlyId

  enum status: { draft: 0, published: 1 }

  friendly_id :title, use: :slugged

  validates :title, :body, presence: true
end
