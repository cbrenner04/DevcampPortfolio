# frozen_string_literal: true

require "rails_helper"

RSpec.describe TopicsController, type: :controller do
  let(:user) { create :user }
  let(:topic) { create :topic }
  let(:valid_params) { { topic: { title: "foo" } } }
  let(:invalid_params) { { topic: { title: nil } } }
  let(:valid_session) { {} }

  before { sign_in user }

  describe "GET #index" do
    before { get :index, session: valid_session }

    it { expect(response).to be_success }
    it { expect(assigns(:topics)).to include topic }
  end

  describe "GET #show" do
    before { get :show, params: { id: topic.to_param }, session: valid_session }

    it { expect(response).to be_success }
    it { expect(assigns(:topic)).to eq(topic) }
  end

  describe "GET #new" do
    before { get :new, session: valid_session }

    it { expect(response).to be_success }
    it { expect(assigns(:topic)).to be_a_new Topic }
  end

  describe "GET #edit" do
    before { get :edit, params: { id: topic.to_param }, session: valid_session }

    it { expect(response).to be_success }
    it { expect(assigns(:topic)).to eq topic }
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new topic" do
        expect do
          post :create, params: valid_params, session: valid_session
        end.to change(Topic, :count).by(1)
      end

      it "assigns a newly created topic as @topic" do
        post :create, params: valid_params, session: valid_session
        expect(assigns(:topic)).to be_a(Topic)

        expect(assigns(:topic)).to be_persisted
      end

      it "redirects to the index" do
        post :create, params: valid_params, session: valid_session

        expect(response).to redirect_to topics_path
      end
    end

    context "with invalid params" do
      before { post :create, params: invalid_params }

      it { expect(assigns(:topic)).to be_a_new(Topic) }
      it { expect(response).to render_template :new }
    end
  end

  describe "POST #update" do
    context "with valid params" do
      let(:update_params) { { title: "update foo" } }
      let(:valid_params) { { id: topic.to_param, topic: update_params } }

      before { put :update, params: valid_params, session: valid_session }

      it "updates a topic" do
        topic.reload

        expect(topic.title).to eq "update foo"
      end

      it { expect(assigns(:topic)).to eq(topic) }
      it { expect(response).to redirect_to topics_path }
    end

    context "with invalid params" do
      let(:invalid_params) { { id: topic.to_param, topic: { title: nil } } }

      before { put :update, params: invalid_params, session: valid_session }

      it { expect(assigns(:topic)).to eq(topic) }
      it { expect(response).to render_template :edit }
    end
  end

  describe "DELETE #destroy" do
    let!(:topic) { create :topic }

    it "destroys the requested topic" do
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
