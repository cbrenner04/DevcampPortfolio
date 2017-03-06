# frozen_string_literal: true
require 'rails_helper'

RSpec.describe PortfoliosController, type: :controller do
  let(:valid_attributes) do
    {
      title: "Foo",
      subtitle: "Bar",
      body: "Baz",
      main_image: "f@e.com",
      thumb_image: "f@e.com"
    }
  end

  let(:invalid_attributes) { { title: nil } }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all portfolio_items as @portfolio_items' do
      portfolio_item = create :portfolio
      get :index, params: {}, session: valid_session

      expect(assigns(:portfolio_items)).to eq([portfolio_item])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested portfolio_item as @portfolio_item' do
      portfolio_item = create :portfolio
      get :show, params: { id: portfolio_item.to_param }, session: valid_session

      expect(assigns(:portfolio_item)).to eq(portfolio_item)
    end
  end

  describe 'GET #new' do
    it 'assigns a new portfolio_item as @portfolio_item' do
      get :new, params: {}, session: valid_session

      expect(assigns(:portfolio_item)).to be_a_new(Portfolio)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested portfolio as @portfolio' do
      portfolio_item = create :portfolio
      get :edit, params: { id: portfolio_item.to_param }, session: valid_session

      expect(assigns(:portfolio_item)).to eq(portfolio_item)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new portfolio' do
        expect do
          post :create, params: {
            portfolio: valid_attributes
          }, session: valid_session
        end.to change(Portfolio, :count).by(1)
      end

      it 'assigns a newly created portfolio as @portfolio' do
        post :create, params: { portfolio: valid_attributes }, session: valid_session
        expect(assigns(:portfolio_item)).to be_a(Portfolio)

        expect(assigns(:portfolio_item)).to be_persisted
      end

      it 'redirects to the created portfolio' do
        post :create, params: { portfolio: valid_attributes }, session: valid_session

        expect(response).to redirect_to portfolios_path
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved portfolio as @portfolio' do
        post :create, params: {
          portfolio: invalid_attributes
        }, session: valid_session

        expect(assigns(:portfolio_item)).to be_a_new(Portfolio)
      end

      it "re-renders the 'new' template" do
        post :create, params: {
          portfolio: invalid_attributes
        }, session: valid_session

        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { title: 'Baz' } }

      it 'updates the requested portfolio' do
        portfolio = create :portfolio
        put :update, params: {
          id: portfolio.to_param, portfolio: new_attributes
        }, session: valid_session
        portfolio.reload

        expect(portfolio.title).to eq 'Baz'
      end

      it 'assigns the requested portfolio as @portfolio' do
        portfolio_item = create :portfolio
        put :update, params: {
          id: portfolio_item.to_param, portfolio: valid_attributes
        }, session: valid_session

        expect(assigns(:portfolio_item)).to eq(portfolio_item)
      end

      it 'redirects to the portfolio' do
        portfolio = create :portfolio
        put :update, params: {
          id: portfolio.to_param, portfolio: valid_attributes
        }, session: valid_session

        expect(response).to redirect_to(portfolios_path)
      end
    end

    context 'with invalid params' do
      it 'assigns the portfolio as @portfolio' do
        portfolio_item = create :portfolio
        put :update, params: {
          id: portfolio_item.to_param, portfolio: invalid_attributes
        }, session: valid_session

        expect(assigns(:portfolio_item)).to eq(portfolio_item)
      end

      it "re-renders the 'edit' template" do
        portfolio = create :portfolio
        put :update, params: {
          id: portfolio.to_param, portfolio: invalid_attributes
        }, session: valid_session

        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested portfolio' do
      portfolio = create :portfolio
      expect do
        delete :destroy, params: { id: portfolio.to_param }, session: valid_session
      end.to change(Portfolio, :count).by(-1)
    end

    it 'redirects to the portfolios list' do
      portfolio = create :portfolio
      delete :destroy, params: { id: portfolio.to_param }, session: valid_session

      expect(response).to redirect_to(portfolios_url)
    end
  end
end
