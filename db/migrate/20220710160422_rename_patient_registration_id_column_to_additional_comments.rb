# frozen_string_literal: true

class RenamePatientRegistrationIdColumnToAdditionalComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :additional_comments, :patient_registration_id, :patient_id
  end
end
