# frozen_string_literal: true

require "rails_helper"

RSpec.describe PortfoliosController, type: :controller do
  let(:valid_params) do
    {
      portfolio: {
        title: "Foo",
        subtitle: "Bar",
        body: "Baz",
        main_image: "f@e.com",
        thumb_image: "f@e.com"
      }
    }
  end

  let(:invalid_params) { { portfolio: { title: nil } } }
  let(:valid_session) { {} }
  let(:user) { create :user }
  let(:portfolio_item) { create :portfolio }

  before { sign_in user }

  describe "GET #index" do
    before { get :index, session: valid_session }

    it { expect(response).to be_success }
    it { expect(assigns(:portfolio_items)).to eq([portfolio_item]) }
  end

  describe "GET #show" do
    before do
      get :show, params: { id: portfolio_item.to_param }, session: valid_session
    end

    it { expect(response).to be_success }
    it { expect(assigns(:portfolio_item)).to eq(portfolio_item) }
  end

  describe "GET #new" do
    before { get :new, session: valid_session }

    it { expect(response).to be_success }
    it { expect(assigns(:portfolio_item)).to be_a_new(Portfolio) }
  end

  describe "GET #edit" do
    before do
      get :edit, params: { id: portfolio_item.to_param }, session: valid_session
    end

    it { expect(response).to be_success }
    it { expect(assigns(:portfolio_item)).to eq(portfolio_item) }
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new portfolio" do
        expect do
          post :create, params: valid_params, session: valid_session
        end.to change(Portfolio, :count).by(1)
      end

      it "assigns a newly created portfolio as @portfolio" do
        post :create, params: valid_params, session: valid_session

        expect(assigns(:portfolio_item)).to be_a(Portfolio)
        expect(assigns(:portfolio_item)).to be_persisted
      end

      it "redirects to the created portfolio" do
        post :create, params: valid_params, session: valid_session

        expect(response).to redirect_to portfolios_path
      end
    end

    context "with invalid params" do
      before { post :create, params: invalid_params, session: valid_session }

      it { expect(assigns(:portfolio_item)).to be_a_new(Portfolio) }
      it { expect(response).to render_template("new") }
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { title: "Baz" } }
      let(:valid_params) do
        { id: portfolio_item.to_param, portfolio: new_attributes }
      end

      before { put :update, params: valid_params, session: valid_session }

      it "updates the requested portfolio" do
        portfolio_item.reload

        expect(portfolio_item.title).to eq "Baz"
      end

      it { expect(assigns(:portfolio_item)).to eq(portfolio_item) }
      it { expect(response).to redirect_to(portfolios_path) }
    end

    context "with invalid params" do
      let(:invalid_params) do
        { id: portfolio_item.to_param, portfolio: { title: nil } }
      end

      before { put :update, params: invalid_params, session: valid_session }

      it { expect(assigns(:portfolio_item)).to eq(portfolio_item) }
      it { expect(response).to render_template("edit") }
    end
  end

  describe "PUT #sort" do
    before do
      put :sort, params: {
        order: {
          foo: { id: portfolio_item.id, position: 2 }
        }
      }, session: valid_session
    end

    it { expect(response).to be_success }
  end

  describe "DELETE #destroy" do
    let!(:portfolio) { create :portfolio }

    it "destroys the requested portfolio" do
      expect do
        delete :destroy, params: {
          id: portfolio.to_param
        }, session: valid_session
      end.to change(Portfolio, :count).by(-1)
    end

    it "redirects to the portfolios list" do
      delete :destroy, params: {
        id: portfolio.to_param
      }, session: valid_session

      expect(response).to redirect_to(portfolios_url)
    end
  end
end
