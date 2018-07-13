class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :value,
    presence: true,
    numericality: {
      less_than: Settings.rating.value.maximum,
      greater_than: Settings.rating.value.minimum,
      only_integer: true
    }
end
