class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, presence: true
  validates :product_id, presence: true

  class << self
    def total_price cart
      total = 0
      cart.each do |c|
        total += c.product.price * c.quantity
      end
      return total
    end
  end
end
