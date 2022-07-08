# frozen_string_literal: true

class CreateAdditionalComments < ActiveRecord::Migration[6.1]
  def change
    create_table :additional_comments do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :patient_registration

      t.timestamps
    end
  end
end
