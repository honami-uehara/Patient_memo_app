# frozen_string_literal: true

class RenamePostIdColumnToBookmarks < ActiveRecord::Migration[6.1]
  def change
    rename_column :bookmarks, :post_id, :patient_registration_id
  end
end
