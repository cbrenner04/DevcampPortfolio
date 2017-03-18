# frozen_string_literal: true
FactoryGirl.define do
  factory :blog do
    title "Foo"
    body "Bar"
    slug "foo"
    status "draft"
    topic
  end
end
