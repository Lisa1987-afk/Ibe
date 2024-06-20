class Like < ApplicationRecord
  belongs_to :user
  belongs_to :vegan
  validates_uniqueness_of :vegan_id, scope: :user_id
end
