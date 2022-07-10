# frozen_string_literal: true

FactoryBot.define do
  factory :bookmark do
    association :patient_registration
    association :user
  end
end
