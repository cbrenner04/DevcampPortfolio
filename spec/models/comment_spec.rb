# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment, type: :model do
  let(:comment) { create :comment }

  describe "validations" do
    it { expect(comment).to be_valid }

    describe "with no content" do
      before { comment.content = nil }

      it { expect(comment).to be_invalid }
    end

    describe "with content greater than maximum" do
      before do
        comment.content = SecureRandom.hex((Comment::MAXIMUM_LENGTH + 2) / 2)
      end

      it { expect(comment).to be_invalid }
    end
  end
end
