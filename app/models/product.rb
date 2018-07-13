class Product < ApplicationRecord
  has_many :product_orders
  has_many :rattings
  belongs_to :category

  validates :name, presence: true,
    length: {minimum: Settings.product.length.name_min_length}
  validates :price, presence: true,
    length: {minimum: Settings.product.length.price_min}
  validates :quantity, presence: true,
    length: {minimum: Settings.product.length.quantity_min}
  validates :detail, presence: true
  validates :number_ratting, presence: true
  validates :ratting_mark, presence: true
end
