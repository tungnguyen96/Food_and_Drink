class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :value, presence: true,
    numericality: {only_integer: true,
      greater_than: Settings.rating.value.minimum,
      less_than: Settings.rating.value.maximum}
end
