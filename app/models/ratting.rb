class Ratting < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :value, presence: true
end
