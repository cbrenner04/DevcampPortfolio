# frozen_string_literal: true
require "rails_helper"

RSpec.describe TweetsController, type: :controller do
  describe "GET #index" do
    it "assigns @tweets as 6 tweets" do
      get :index

      expect(assigns(:tweets).count).to eq 6
    end
  end
end
