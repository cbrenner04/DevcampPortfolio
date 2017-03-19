# frozen_string_literal: true
# about me actions
class AboutsController < ApplicationController
  def show
    @skills = Skill.descending
  end
end
