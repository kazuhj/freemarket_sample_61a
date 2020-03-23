class SnsCredential < ApplicationRecord
  # アソシエーション
  belongs_to :user, optional: true
end
