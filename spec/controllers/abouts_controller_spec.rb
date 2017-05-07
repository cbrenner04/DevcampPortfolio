# frozen_string_literal: true

require "rails_helper"

RSpec.describe AboutsController, type: :controller do
  let(:most_skilled) { create :skill, percent_utilized: 67 }
  let(:least_skilled) { create :skill, percent_utilized: 2 }

  describe "GET #show" do
    before { get :show }

    it { expect(response).to be_success }
    it { expect(assigns(:skills)).to eq [most_skilled, least_skilled] }
  end
end
