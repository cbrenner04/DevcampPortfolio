# frozen_string_literal: true

FactoryGirl.define do
  factory :comment do
    user
    blog
    content "MyText"
  end
end
