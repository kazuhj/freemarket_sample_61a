class Telephone < ApplicationRecord

  # アソシエーション
  belongs_to :user, optional: true

  # バリデーション
  validates :tel ,presence: true, format: { with: /\A\d{11}\z/} # ハイフンなしの11桁
end
