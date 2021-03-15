# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    blog
    content { "MyText" }
  end
end
