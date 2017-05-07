# frozen_string_literal: true

require "rails_helper"

RSpec.describe Topic, type: :model do
  let(:topic) { create :topic }

  describe "validations" do
    it { expect(topic).to be_valid }

    describe "with no title" do
      before { topic.title = nil }

      it { expect(topic).to_not be_valid }
    end
  end

  describe ".with_blogs" do
    let!(:topic2) { create :topic }

    before { create :blog, topic: topic }

    it { expect(Topic.with_blogs).to eq [topic] }
  end
end
