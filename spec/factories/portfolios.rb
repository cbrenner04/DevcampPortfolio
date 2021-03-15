# frozen_string_literal: true

FactoryBot.define do
  factory :portfolio do
    title { "Foo" }
    subtitle { "Bar" }
    body { "Foobar" }
    main_image { "http://foo.bar" }
    thumb_image { "http://foo.bar" }
  end
end
