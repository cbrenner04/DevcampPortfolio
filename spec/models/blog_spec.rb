# frozen_string_literal: true

require "rails_helper"

RSpec.describe Blog, type: :model do
  let(:blog) { create :blog }

  describe "validations" do
    it { expect(blog).to be_valid }

    describe "with no title" do
      before { blog.title = nil }

      it { expect(blog).to be_invalid }
    end

    describe "with no body" do
      before { blog.body = nil }

      it { expect(blog).to be_invalid }
    end

    describe "with no topic" do
      before { blog.topic = nil }

      it { expect(blog).to be_invalid }
    end
  end

  describe ".descending" do
    let!(:blog1) { create :blog, slug: "foo" }
    let!(:blog2) { create :blog, slug: "bar" }

    it { expect(Blog.descending).to eq [blog2, blog1] }
  end
end
