# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  before { @portfolio = create :portfolio }

  describe 'creation' do
    it { expect(@portfolio).to be_valid }
  end

  describe 'validations' do
    it 'is invalid when no title' do
      @portfolio.title = nil

      expect(@portfolio).to_not be_valid
    end

    it 'is invalid when no body' do
      @portfolio.body = nil

      expect(@portfolio).to_not be_valid
    end
  end
end
