# frozen_string_literal: true

# model for technologies used relating to portfolios
class Technology < ApplicationRecord
  belongs_to :portfolio
end
