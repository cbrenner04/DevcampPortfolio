# frozen_string_literal: true
# actions for comments in blog posts
class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
