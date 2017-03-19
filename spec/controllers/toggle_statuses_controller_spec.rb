# frozen_string_literal: true
require "rails_helper"

RSpec.describe ToggleStatusesController, type: :controller do
  let(:blog) { create :blog, status: "published" }
  let(:user) { create :user }

  before { sign_in user }

  describe "GET #show" do
    it "assigns @blog as a blog" do
      get :show, params: { blog_id: blog.slug }

      expect(assigns(:blog)).to eq blog
    end

    it "updates the status of the blog" do
      get :show, params: { blog_id: blog.slug }
      blog.reload

      expect(blog.status).to eq "draft"
    end
  end
end
