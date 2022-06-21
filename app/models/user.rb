class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :patient_registrations, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_patient_registrations, through: :bookmarks, source: :patient_registration
  has_many :additional_comments

  validates :username, presence: true, length: { maximum: 10 }

  def already_bookmarkd?(patient_registration)
    self.bookmarks.exists?(patient_registration_id: patient_registration.id)
  end
end
