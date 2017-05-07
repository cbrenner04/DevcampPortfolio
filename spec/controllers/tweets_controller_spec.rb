# frozen_string_literal: true
require "rails_helper"

RSpec.describe TweetsController, type: :controller do
  describe "GET #index" do
    before { get :index }

    it { expect(response).to be_success }
    it { expect(assigns(:tweets).count).to eq 6 }
  end
end
