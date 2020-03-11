class Telephone < ApplicationRecord
  belongs_to :user, optional: true
end
