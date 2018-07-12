class Product < ApplicationRecord
  has_many :product_orders
  has_many :rattings
  belongs_to :category
end
