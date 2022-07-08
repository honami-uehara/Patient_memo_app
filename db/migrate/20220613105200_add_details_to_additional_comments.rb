# frozen_string_literal: true

class AddDetailsToAdditionalComments < ActiveRecord::Migration[6.1]
  def change
    add_column :additional_comments, :posted_date, :date
  end
end
