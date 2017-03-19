# frozen_string_literal: true
# helpers for portfolio views
module PortfoliosHelper
  def image_generator(height:, width:)
    "https://placeholdit.imgix.net/~text?txtsize=33&txt=#{width}%C3%97" \
    "#{height}&w=#{width}&h=#{height}"
  end

  def portfolio_img(image:, type:)
    if image.model.main_image? || image.model.thumb_image?
      image
    elsif type == "thumb"
      image_generator(height: 200, width: 350)
    elsif type == "main"
      image_generator(height: 400, width: 600)
    end
  end
end
