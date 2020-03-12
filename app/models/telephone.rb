class Telephone < ApplicationRecord
  belongs_to :user, optional: true
  validates :tel ,presence: true
end
