# frozen_string_literal: true

# actions for home page
class HomesController < ApplicationController
  def show
    @posts = Blog.all
  end
end
