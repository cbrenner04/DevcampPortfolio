# frozen_string_literal: true
# no doc
class Portfolio < ApplicationRecord
  validates :title, presence: true
end
