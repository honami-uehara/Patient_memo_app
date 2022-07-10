# frozen_string_literal: true

class ChangePatientRegistrationsToPatients < ActiveRecord::Migration[6.1]
  def change
    rename_table :patient_registrations, :patients
  end
end
