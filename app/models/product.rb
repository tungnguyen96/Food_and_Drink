class Product < ApplicationRecord
  has_many :product_orders
  has_many :rattings
  belongs_to :category

  validates :name, presence: true,
    length: {minimum: Settings.product.length.name_min_length}
  validates :price, presence: true
  validates :quantity, presence: true
  validates :detail, presence: true
end
