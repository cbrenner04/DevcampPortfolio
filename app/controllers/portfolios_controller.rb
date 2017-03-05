# frozen_string_literal: true
# portfolio actions
class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def show; end
end
