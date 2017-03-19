# frozen_string_literal: true
# actions for tweets page
class TweetsController < ApplicationController
  def index
    @tweets = SocialTool.twitter_search
  end
end
