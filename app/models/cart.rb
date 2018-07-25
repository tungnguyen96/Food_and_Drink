class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, presence: true
  validates :product_id, presence: true

  class << self
    def total_price carts
      total = 0
      carts.each do |c|
        next unless c.product.present?
        if c.product.quantity == 0
          total = total
        elsif c.product.quantity < c.quantity
          total += c.product.price * c.product.quantity
        else
          total += c.product.price * c.quantity
        end
      end
      return total
    end
  end
end
