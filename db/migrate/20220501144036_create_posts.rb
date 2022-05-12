class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :warn
      t.string :phone_number
      t.integer :medical_record_number
      t.date :visit_date
      t.text :maintenance_or_treatment

      t.timestamps
    end
  end
end
