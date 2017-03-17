# frozen_string_literal: true
# actions for Topics which are related to blogs
class TopicsController < ApplicationController
  layout 'blog'

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    blogs = @topic.blogs.descending
    blogs = logged_in?(:admin) ? blogs : blogs.published
    @blogs = blogs.page(params[:page]).per(5)
  end
end