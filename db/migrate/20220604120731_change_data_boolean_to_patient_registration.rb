class ChangeDataBooleanToPatientRegistration < ActiveRecord::Migration[6.1]
  def change
    change_column :patient_registrations, :maintenance_or_treatment, :text
  end
end
