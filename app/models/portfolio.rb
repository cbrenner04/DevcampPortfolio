# frozen_string_literal: true

# model for portfolios
class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy

  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: ->(attrs) { attrs[:name].blank? }

  validates :title, :body, presence: true

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.by_position
    order(:position)
  end
end
