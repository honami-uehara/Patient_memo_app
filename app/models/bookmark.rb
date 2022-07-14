# frozen_string_literal: true

class Bookmark < ApplicationRecord
  belongs_to :patient
  belongs_to :user
  validates_uniqueness_of :patient_id, scope: :user_id

  with_options presence: true do
    validates :user_id
    validates :patient_id
  end
end

