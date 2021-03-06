# frozen_string_literal: true

require "rails_helper"

RSpec.describe HomesController, type: :controller do
  let(:blog) { create :blog }

  describe "GET #show" do
    before { get :show }

    it { expect(response).to be_successful }
    it { expect(assigns(:posts)).to include blog }
  end
end
