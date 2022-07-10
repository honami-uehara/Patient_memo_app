# frozen_string_literal: true

class Bookmark < ApplicationRecord
  belongs_to :patient_registration
  belongs_to :user
  validates_uniqueness_of :patient_registration_id, scope: :user_id

  with_options presence: true do
    validates :user_id
    validates :patient_registration_id
  end
end
