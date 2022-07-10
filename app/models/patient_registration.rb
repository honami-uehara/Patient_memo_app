# frozen_string_literal: true

class PatientRegistration < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarkd_users, through: :bookmarks, source: :user
  has_many :additional_comments, dependent: :destroy

  with_options presence: true do
    validates :name, length: { maximum: 10 }
    validates :warn
    validates :phone_number
    validates :medical_record_number
    validates :maintenance_or_treatment
    validates :visit_date
  end

  validate :day_after_today, on: :create

  def day_after_today
    errors.add(:visit_date, '今日を含む過去の日付を入力して下さい') if visit_date > Date.today
  end
end
