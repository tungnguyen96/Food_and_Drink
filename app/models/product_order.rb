class ProductOrder < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true,
    numericality: {greater_than: Settings.product_order.quantity.minimum,only_integer: true}
  validates :total_price, presence: true, numericality: {greater_than: Settings.product_order.total_price.minimum, only_integer: true}
end
