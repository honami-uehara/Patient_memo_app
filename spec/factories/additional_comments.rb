FactoryBot.define do
  factory :additional_comment do
    content { "MyString" }
    association :user
    association :patient_registration
  end
end
