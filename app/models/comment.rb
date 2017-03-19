# frozen_string_literal: true
# model for comments which relate to blogs and users
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { mininum: 5, maximum: 1000 }

  after_create_commit { CommentBroadcastJob.perform_later(self) }
end
