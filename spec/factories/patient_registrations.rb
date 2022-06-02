FactoryBot.define do
  factory :patient_registration do
    name { "MyString" }
    warn { "MyText" }
    phone_number { "MyString" }
    medical_record_number { 1 }
    visit_date { "2022-05-01" }
    maintenance_or_treatment { "MyText" }
    user_id { 1 }
  end
end
