FactoryBot.define do
  factory :additional_comment do
    content { "MyString" }
    user { nil }
    patient_registration { "" }
  end
end
