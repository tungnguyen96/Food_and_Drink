class Product < ApplicationRecord
  DEFAULT_SORT_TYPE = :name
  DEFAULT_SORT_ORDER = :asc

  has_many :product_orders
  has_many :ratings
  has_many :orders, through: :product_orders, dependent: :destroy
  belongs_to :category
  mount_uploader :picture, PictureUploader

  validates :name, presence: true, uniqueness: true,
    length: {minimum: Settings.product.name.minimum}
  validates :price, presence: true,
    numericality: {
      greater_than: Settings.product.price.minimum,
      only_integer: true
    }
  validates :quantity, presence: true,
    numericality: {
      greater_than_or_equal_to: Settings.product.quantity.minimum,
      only_integer: true
    }
  validates :detail, presence: true
  validates :rate_average, presence: true
  # validate  :picture_size

  scope :filter_product, ->(sort_type, sort_order){
    order sort_type || DEFAULT_SORT_TYPE => sort_order || DEFAULT_SORT_ORDER
  }
  scope :latest_product, ->{order(created_at: :desc).limit 3}

  def rate value, user
    ratings.create(value: value, user_id: user.id)
    update_rate_average
  end

  def update_rate_average
    return if rate_counts.zero?
    update rate_average: (total_rate_points / rate_counts).round
  end

  def rated_by? user
    Rating.exists?(user: user, product: self)
  end

  private

  def total_rate_points
    return if ratings.values.nil?
    ratings.sum(&:value)
  end

  def rate_counts
    ratings.count
  end

  # def picture_size
  #   if picture.size > 2.megabytes
  #     errors.add(:picture, "should be less than 2MB")
  #   end
  # end
end
