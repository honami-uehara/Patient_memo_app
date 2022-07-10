# frozen_string_literal: true

FactoryBot.define do
  factory :patient_registration do
    name { 'MyString' }
    warn { 'MyText' }
    phone_number { 'MyString' }
    medical_record_number { 1 }
    visit_date { '2022-05-01' }
    maintenance_or_treatment { 'MyText' }
    user_id { 1 }

    trait :invalid do
      name { nil }
      warn { nil }
      phone_number { nil }
      medical_record_number { nil }
      visit_date { nil }
      maintenance_or_treatment { nil }
      user_id { nil }
    end
  end
end
