# frozen_string_literal: true

# actions for blogs
class BlogsController < ApplicationController
  access all: %i[show index],
         user: { except: %i[destroy new create update edit] },
         admin: :all
  # rubocop:disable Rails/LexicallyScopedActionFilter
  before_action :set_blog,
                only: %i[show edit update destroy toggle_status]
  # rubocop:enable Rails/LexicallyScopedActionFilter
  before_action :set_sidebar_topics, only: %i[index new edit show]
  layout "blog"

  def index
    @page_title = "My Portfolio Blog"
    blogs = logged_in?(:admin) ? Blog.descending : Blog.descending.published
    @blogs = blogs.page(params[:page]).per(5)
  end

  def show
    if logged_in?(:admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new
      @page_title = @blog.title
    else
      redirect_to blogs_path,
                  notice: "You are not authorized to access this page"
    end
  end

  def new
    @blog = Blog.new
  end

  def edit; end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog, notice: "Blog successfully created."
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: "Blog successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: "Blog destroyed."
  end

  private

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def set_sidebar_topics
    @sidebar_topics = Topic.with_blogs
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :topic_id, :status)
  end
end
