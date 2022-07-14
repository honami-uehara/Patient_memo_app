# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :patients, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_patients, through: :bookmarks, source: :patient
  has_many :additional_comments, dependent: :destroy

  validates :username, presence: true, length: { maximum: 10 }

  def already_bookmarkd?(patient)
    bookmarks.exists?(patient_id: patient.id)
  end
end

