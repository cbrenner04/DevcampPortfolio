# frozen_string_literal: true
# no doc
class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
end
