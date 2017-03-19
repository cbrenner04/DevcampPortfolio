# frozen_string_literal: true
require "rails_helper"

RSpec.describe AboutsController, type: :controller do
  let(:most_skilled) { create :skill, percent_utilized: 67 }
  let(:least_skilled) { create :skill, percent_utilized: 2 }

  describe "GET #show" do
    it "assigns @skills as all Skills in descending order" do
      get :show

      expect(assigns(:skills)).to eq [most_skilled, least_skilled]
    end
  end
end
