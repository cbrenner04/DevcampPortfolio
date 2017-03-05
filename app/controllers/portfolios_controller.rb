# frozen_string_literal: true
# portfolio actions
class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  # TODO: clean up
  # rubocop:disable MethodLength
  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html do
          redirect_to portfolios_path,
                      notice: 'Portfolio item successfully created.'
        end
        format.json do
          render :show,
                 status: :created,
                 location: @portfolio_item
        end
      else
        format.html { render :new }
        format.json do
          render json: @portfolio_item.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end
  # rubocop:enable MethodLength

  private

  def portfolio_params
    params
      .require(:portfolio)
      .permit(:title, :subtitle, :body, :main_image, :thumb_image)
  end
end
