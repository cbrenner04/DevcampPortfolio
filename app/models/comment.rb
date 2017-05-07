# frozen_string_literal: true

# model for comments which relate to blogs and users
class Comment < ApplicationRecord
  MAXIMUM_LENGTH = 1000
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { maximum: MAXIMUM_LENGTH }

  after_create_commit { CommentBroadcastJob.perform_later(self) }
end
