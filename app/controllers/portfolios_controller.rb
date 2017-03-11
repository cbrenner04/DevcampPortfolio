# frozen_string_literal: true
# portfolio actions
class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  def index
    @portfolio_items = Portfolio.all
  end

  def show; end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
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

  def edit; end

  # TODO: clean up
  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html do
          redirect_to portfolios_path,
                      notice: 'Portfolio item successfully updated.'
        end
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json do
          render json: @portfolio_item.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end
  # rubocop:enable MethodLength

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html do
        redirect_to portfolios_path,
                    notice: 'Portfolio item destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def portfolio_params
    params
      .require(:portfolio)
      .permit(:title, :subtitle, :body, :main_image, :thumb_image,
              technologies_attributes: [:name])
  end

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end
end
