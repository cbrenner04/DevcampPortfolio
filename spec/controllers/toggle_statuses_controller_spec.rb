# frozen_string_literal: true
require "rails_helper"

RSpec.describe ToggleStatusesController, type: :controller do
  let(:blog) { create :blog, status: "published" }
  let(:user) { create :user }

  before { sign_in user }

  describe "GET #show" do
    before { get :show, params: { blog_id: blog.slug } }

    it { expect(assigns(:blog)).to eq blog }

    it "updates the status of the blog" do
      blog.reload

      expect(blog.status).to eq "draft"
    end
  end
end
