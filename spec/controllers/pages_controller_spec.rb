# frozen_string_literal: true
require "rails_helper"

RSpec.describe PagesController, type: :controller do
  let(:blog) { create :blog }
  let(:most_skilled) { create :skill, percent_utilized: 67 }
  let(:least_skilled) { create :skill, percent_utilized: 2 }

  describe "GET #home" do
    it "assigns @posts as all Blogs" do
      get :home

      expect(assigns(:posts)).to include blog
    end
  end

  describe "GET #about" do
    it "assigns @skills as all Skills in descending order" do
      get :about

      expect(assigns(:skills)).to eq [most_skilled, least_skilled]
    end
  end

  describe "GET #contact" do
    it "has status 200" do
      get :contact

      expect(response.status).to be 200
    end
  end

  describe "GET #tweets" do
    it "assigns @tweets as 6 tweets" do
      get :tweets

      expect(assigns(:tweets).count).to eq 6
    end
  end
end
