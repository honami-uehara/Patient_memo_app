# frozen_string_literal: true

FactoryBot.define do
  factory :bookmark do
    association :patient
    association :user
  end
end

