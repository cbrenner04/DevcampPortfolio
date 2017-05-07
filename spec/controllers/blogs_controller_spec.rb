# frozen_string_literal: true

require "rails_helper"

RSpec.describe BlogsController, type: :controller do
  let(:topic) { create :topic }
  let(:valid_params) do
    { blog: { title: "Foo", body: "Bar", topic_id: topic.id } }
  end
  let(:invalid_params) { { blog: { title: nil } } }
  let(:valid_session) { {} }
  let(:user) { create :user }
  let(:blog) { create :blog }

  before { sign_in user }

  describe "GET #index" do
    before { get :index, session: valid_session }

    it { expect(response).to be_success }
    it { expect(assigns(:blogs)).to eq([blog]) }
  end

  describe "GET #show" do
    before { get :show, params: { id: blog.to_param }, session: valid_session }

    it { expect(response).to be_success }
    it { expect(assigns(:blog)).to eq(blog) }
  end

  describe "GET #new" do
    before { get :new, params: {}, session: valid_session }

    it { expect(response).to be_success }
    it { expect(assigns(:blog)).to be_a_new(Blog) }
  end

  describe "GET #edit" do
    before { get :edit, params: { id: blog.to_param }, session: valid_session }

    it { expect(response).to be_success }
    it { expect(assigns(:blog)).to eq(blog) }
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new blog" do
        expect do
          post :create, params: valid_params, session: valid_session
        end.to change(Blog, :count).by(1)
      end

      it "assigns a newly created blog as @blog" do
        post :create, params: valid_params, session: valid_session
        expect(assigns(:blog)).to be_a(Blog)

        expect(assigns(:blog)).to be_persisted
      end

      it "redirects to the created Blog" do
        post :create, params: valid_params, session: valid_session

        expect(response).to redirect_to(Blog.last)
      end
    end

    context "with invalid params" do
      before { post :create, params: invalid_params, session: valid_session }

      it { expect(assigns(:blog)).to be_a_new(Blog) }
      it { expect(response).to render_template("new") }
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { title: "Baz" } }
      let(:valid_params) { { id: blog.to_param, blog: new_attributes } }

      before { put :update, params: valid_params, session: valid_session }

      it "updates the requested blog" do
        blog.reload

        expect(blog.title).to eq "Baz"
      end

      it { expect(assigns(:blog)).to eq(blog) }
      it { expect(response).to redirect_to(blog) }
    end

    context "with invalid params" do
      let(:invalid_params) { { id: blog.to_param, blog: { title: nil } } }

      before { put :update, params: invalid_params, session: valid_session }

      it { expect(assigns(:blog)).to eq(blog) }
      it { expect(response).to render_template("edit") }
    end
  end

  describe "DELETE #destroy" do
    let!(:blog) { create :blog }

    it "destroys the requested Blog" do
      expect do
        delete :destroy, params: { id: blog.to_param }, session: valid_session
      end.to change(Blog, :count).by(-1)
    end

    it "redirects to the Blogs list" do
      delete :destroy, params: { id: blog.to_param }, session: valid_session

      expect(response).to redirect_to(blogs_url)
    end
  end
end
