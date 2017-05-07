# frozen_string_literal: true
# action for toggling status of blog
class ToggleStatusesController < ApplicationController
  access all: { except: [:show] },
         user: { except: [:show] },
         admin: [:show]
  layout "blog"

  def show
    @blog = Blog.friendly.find(params[:blog_id])
    @blog.draft? ? @blog.published! : @blog.draft!
    redirect_to blogs_url, notice: "Blog status has been updated"
  end
end
