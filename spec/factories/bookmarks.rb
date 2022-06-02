FactoryBot.define do
  factory :bookmark do
    association :patient_registration
    association :user
  end
end
