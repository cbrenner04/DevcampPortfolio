# frozen_string_literal: true
FactoryGirl.define do
  factory :comment do
    user nil
    blog nil
    content 'MyText'
  end
end
