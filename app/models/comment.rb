# frozen_string_literal: true
# no doc
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { mininum: 5, maximum: 1000 }
end
