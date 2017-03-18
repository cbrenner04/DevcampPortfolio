# frozen_string_literal: true
require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:user) { create :user }

  before { sign_in user }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested topic as @topic' do
      topic = create :topic
      get :show, params: { id: topic.to_param }

      expect(assigns(:topic)).to eq(topic)
    end
  end
end
