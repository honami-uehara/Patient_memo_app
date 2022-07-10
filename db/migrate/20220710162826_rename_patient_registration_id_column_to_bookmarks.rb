# frozen_string_literal: true

class RenamePatientRegistrationIdColumnToBookmarks < ActiveRecord::Migration[6.1]
  def change
    rename_column :bookmarks, :patient_registration_id, :patient_id
  end
end
