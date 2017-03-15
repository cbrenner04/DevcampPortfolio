# frozen_string_literal: true
# pages actions
class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about; end

  def contact; end

  def tweets
    @tweets = SocialTool.twitter_search
  end
end
