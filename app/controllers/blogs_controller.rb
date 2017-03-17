# frozen_string_literal: true
# actions for blogs
class BlogsController < ApplicationController
  access all: [:show, :index],
         user: {
           except: [:destroy, :new, :create, :update, :edit, :toggle_status]
         },
         admin: :all
  before_action :set_blog,
                only: [:show, :edit, :update, :destroy, :toggle_status]
  layout 'blog'

  def index
    @page_title = 'My Portfolio Blog'
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
                  notice: 'You are not authorized to access this page'
    end
  end

  def new
    @blog = Blog.new
  end

  def edit; end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog destroyed.' }
      format.json { head :no_content }
    end
  end

  # TODO: needs test
  def toggle_status
    @blog.draft? ? @blog.published! : @blog.draft!
    redirect_to blogs_url, notice: 'Blog status has been updated'
  end

  private

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :topic_id)
  end
end
