# frozen_string_literal: true
require "rails_helper"

RSpec.describe TopicsController, type: :controller do
  let(:user) { create :user }
  let(:topic) { create :topic }
  let(:invalid_params) { { title: nil } }

  before { sign_in user }

  describe "GET #index" do
    it "returns http success" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "assigns the requested topic as @topic" do
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

  describe "GET #edit" do
    it "assigns requested topic as @topic" do
      get :edit, params: { id: topic.to_param }

      expect(assigns(:topic)).to eq topic
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
      it "re-renders the new page" do
        post :create, params: { topic: invalid_params }

        expect(response).to render_template :new
      end
    end
  end

  describe "POST #update" do
    context "with valid params" do
      let(:update_params) { { title: "update foo" } }

      it "updates a topic" do
        post :update, params: { id: topic.to_param, topic: update_params }
        topic.reload

        expect(topic.title).to eq "update foo"
      end
    end

    context "with invalid params" do
      it "re-renders the edit page" do
        post :update, params: { id: topic.to_param, topic: invalid_params }

        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested topic" do
      topic = create :topic
      expect do
        delete :destroy, params: { id: topic.to_param }
      end.to change(Topic, :count).by(-1)
    end

    it "redirects to the topics list" do
      delete :destroy, params: { id: topic.to_param }

      expect(response).to redirect_to(topics_url)
    end
  end
end
