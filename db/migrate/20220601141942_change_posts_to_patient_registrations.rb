class ChangePostsToPatientRegistrations < ActiveRecord::Migration[6.1]
  def change
    rename_table :posts, :patient_registrations
  end
end
