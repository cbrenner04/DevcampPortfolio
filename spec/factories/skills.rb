# frozen_string_literal: true

FactoryBot.define do
  factory :skill do
    title { "Foo" }
    percent_utilized { 25 }
  end
end
