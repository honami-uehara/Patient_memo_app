class Bookmark < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_uniqueness_of :post_id, scope: :user_id

   with_options presence: true do
     validates :user_id
     validates :post_id
   end
end
