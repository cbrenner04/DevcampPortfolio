# frozen_string_literal: true
# actions for Topics which are related to blogs
class TopicsController < ApplicationController
  access all: [:show, :index],
         user: [:show, :index],
         admin: :all
  layout "blog"

  before_action :set_sidebar_topics

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    blogs = @topic.blogs.descending
    blogs = logged_in?(:admin) ? blogs : blogs.published
    @blogs = blogs.page(params[:page]).per(5)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to topics_path, notice: "Topic successfully saved"
    else
      render :new
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end

  def set_sidebar_topics
    @sidebar_topics = Topic.with_blogs
  end
end
