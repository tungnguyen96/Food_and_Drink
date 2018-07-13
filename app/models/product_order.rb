class ProductOrder < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true,
    length: {minimum: Settings.product_order.length.quantity_min}
  validates :total_price, presence: true
end
