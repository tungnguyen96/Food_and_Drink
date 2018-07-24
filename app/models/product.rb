class Product < ApplicationRecord
  DEFAULT_SORT_TYPE = :name
  DEFAULT_SORT_ORDER = :asc

  has_many :product_orders
  has_many :ratings
  has_many :orders, through: :product_orders
  belongs_to :category
  
  validates :name, presence: true, uniqueness: true,
    length: {minimum: Settings.product.name.minimum}
  validates :price, presence: true,
    numericality: {
      greater_than: Settings.product.price.minimum,
      only_integer: true
    }
  validates :quantity, presence: true,
    numericality: {
      greater_than: Settings.product.quantity.minimum,
      only_integer: true
    }
  validates :detail, presence: true
  validates :rate_average, presence: true,
    numericality: {
      greater_than: Settings.product.rate_average.minimum,
      less_than: Settings.product.rate_average.maximum,
      only_integer: true
    }

  scope :filter_product, ->(sort_type, sort_order){
    order sort_type || DEFAULT_SORT_TYPE => sort_order || DEFAULT_SORT_ORDER
  }
  class << self
    def update_quantity add_quantity, sub_quantity, product_id
      product = Product.find_by id: product_id
      quantity = product.quantity + add_quantity - sub_quantity
      product.update_column :quantity, quantity
    end
  end
end
