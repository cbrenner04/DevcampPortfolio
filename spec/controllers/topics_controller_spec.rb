# frozen_string_literal: true
require "rails_helper"

RSpec.describe TopicsController, type: :controller do
  let(:user) { create :user }

  before { sign_in user }

  describe "GET #index" do
    it "returns http success" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "assigns the requested topic as @topic" do
      topic = create :topic
      get :show, params: { id: topic.to_param }

      expect(assigns(:topic)).to eq(topic)
    end
  end

  describe "GET #new" do
    it "assigns a new topic as @topic" do
      get :new

      expect(assigns(:topic)).to be_a_new Topic
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) { { title: "foo" } }

      it "creates a new topic" do
        expect do
          post :create, params: { topic: valid_params }
        end.to change(Topic, :count).by(1)
      end
    end

    context "with invalid params" do
      let(:invalid_params) { { title: nil } }

      it "re-renders the new page" do
        post :create, params: { topic: invalid_params }

        expect(response).to render_template :new
      end
    end
  end
end
