# frozen_string_literal: true
require "rails_helper"

RSpec.describe ContactsController, type: :controller do
  describe "GET #show" do
    it "has status 200" do
      get :show

      expect(response.status).to be 200
    end
  end
end
