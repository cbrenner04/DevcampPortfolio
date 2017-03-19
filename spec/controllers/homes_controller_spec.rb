# frozen_string_literal: true
require "rails_helper"

RSpec.describe HomesController, type: :controller do
  let(:blog) { create :blog }

  describe "GET #show" do
    it "assigns @posts as all Blogs" do
      get :show

      expect(assigns(:posts)).to include blog
    end
  end
end
