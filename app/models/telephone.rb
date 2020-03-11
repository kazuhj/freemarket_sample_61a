class Telephone < ApplicationRecord
  belongs_to :user, optional: true
  validates :tele ,presence: true
end
