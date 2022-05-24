class Post < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :bookmarkd_users, through: :bookmarks, source: :user

  with_options presence: true do
    validates :name, length: {maximum: 10}
    validates :warn
    validates :phone_number
    validates :medical_record_number
    validates :maintenance_or_treatment
    validates :visit_date
  end


  validate :day_after_today, on: :create

  def day_after_today
    if visit_date > Date.today
      errors.add(:visit_date, "今日を含む過去の日付を入力して下さい")
    end
  end
end