class Card < ApplicationRecord
  belongs_to :user, optional: true
  validates :customer_number, :year, :month, :security_code ,presence: true
end
