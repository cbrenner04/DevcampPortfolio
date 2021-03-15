# frozen_string_literal: true

require "rails_helper"

RSpec.describe Topic, type: :model do
  let(:topic) { create :topic }

  describe "validations" do
    it { expect(topic).to be_valid }

    describe "with no title" do
      before { topic.title = nil }

      it { expect(topic).not_to be_valid }
    end
  end

  describe ".with_blogs" do
    before do
      create :topic
      create :blog, topic: topic
    end

    it { expect(described_class.with_blogs).to eq [topic] }
  end
end
