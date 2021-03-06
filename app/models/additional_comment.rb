# frozen_string_literal: true

class AdditionalComment < ApplicationRecord
  belongs_to :user
  belongs_to :patient
  validates :content, presence: true, length: { maximum: 100 }
end
