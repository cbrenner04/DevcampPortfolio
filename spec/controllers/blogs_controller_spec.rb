# frozen_string_literal: true
require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  let(:valid_attributes) { { title: 'Foo', body: 'Bar' } }

  let(:invalid_attributes) { { title: nil } }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all blogs as @blogs' do
      blog = create :blog
      get :index, params: {}, session: valid_session

      expect(assigns(:blogs)).to eq([blog])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested Blog as @Blog' do
      blog = create :blog
      get :show, params: { id: blog.to_param }, session: valid_session

      expect(assigns(:blog)).to eq(blog)
    end
  end

  describe 'GET #new' do
    it 'assigns a new blog as @blog' do
      get :new, params: {}, session: valid_session

      expect(assigns(:blog)).to be_a_new(Blog)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested blog as @blog' do
      blog = create :blog
      get :edit, params: { id: blog.to_param }, session: valid_session

      expect(assigns(:blog)).to eq(blog)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new blog' do
        expect do
          post :create, params: {
            blog: valid_attributes
          }, session: valid_session
        end.to change(Blog, :count).by(1)
      end

      it 'assigns a newly created blog as @blog' do
        post :create, params: { blog: valid_attributes }, session: valid_session
        expect(assigns(:blog)).to be_a(Blog)

        expect(assigns(:blog)).to be_persisted
      end

      it 'redirects to the created Blog' do
        post :create, params: { blog: valid_attributes }, session: valid_session

        expect(response).to redirect_to(Blog.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved blog as @blog' do
        post :create, params: {
          blog: invalid_attributes
        }, session: valid_session

        expect(assigns(:blog)).to be_a_new(Blog)
      end

      it "re-renders the 'new' template" do
        post :create, params: {
          blog: invalid_attributes
        }, session: valid_session

        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { title: 'Baz' } }

      it 'updates the requested blog' do
        blog = create :blog
        put :update, params: {
          id: blog.to_param, blog: new_attributes
        }, session: valid_session
        blog.reload

        expect(blog.title).to eq 'Baz'
      end

      it 'assigns the requested Blog as @Blog' do
        blog = create :blog
        put :update, params: {
          id: blog.to_param, blog: valid_attributes
        }, session: valid_session

        expect(assigns(:blog)).to eq(blog)
      end

      it 'redirects to the Blog' do
        blog = create :blog
        put :update, params: {
          id: blog.to_param, blog: valid_attributes
        }, session: valid_session

        expect(response).to redirect_to(blog)
      end
    end

    context 'with invalid params' do
      it 'assigns the Blog as @Blog' do
        blog = create :blog
        put :update, params: {
          id: blog.to_param, blog: invalid_attributes
        }, session: valid_session

        expect(assigns(:blog)).to eq(blog)
      end

      it "re-renders the 'edit' template" do
        blog = create :blog
        put :update, params: {
          id: blog.to_param, blog: invalid_attributes
        }, session: valid_session

        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested Blog' do
      blog = create :blog
      expect do
        delete :destroy, params: { id: blog.to_param }, session: valid_session
      end.to change(Blog, :count).by(-1)
    end

    it 'redirects to the Blogs list' do
      blog = create :blog
      delete :destroy, params: { id: blog.to_param }, session: valid_session

      expect(response).to redirect_to(blogs_url)
    end
  end
end
