# frozen_string_literal: true
# TODO: dry up, remove API if unused
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

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  # TODO: clean up
  # rubocop:disable AbcSize, MethodLength
  def update
    @portfolio_item = Portfolio.find(params[:id])
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
  # rubocop:enable AbcSize, MethodLength

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])
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
      .permit(:title, :subtitle, :body, :main_image, :thumb_image)
  end
end
