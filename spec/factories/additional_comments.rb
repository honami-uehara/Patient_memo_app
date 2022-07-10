# frozen_string_literal: true

FactoryBot.define do
  factory :additional_comment do
    content { 'MyString' }
    association :user
    association :patient
  end
end
