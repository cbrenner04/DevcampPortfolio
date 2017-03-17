# frozen_string_literal: true
# pages actions
class PagesController < ApplicationController
  def home
    @posts = Blog.all
  end

  def about
    @skills = Skill.descending
  end

  def contact; end

  def tweets
    @tweets = SocialTool.twitter_search
  end
end
