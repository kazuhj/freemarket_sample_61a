class Telephone < ApplicationRecord

  # アソシエーション
  belongs_to :user, optional: true

  # バリデーション
  validates :tel ,presence: true, format: { with: /\A\d{10,11}\z/} # ハイフンなしの10桁 or 11桁
end
