class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :product

  after_save :update_rating


  validates :value,
    presence: true,
    numericality: {
      less_than: Settings.rating.value.maximum,
      greater_than: Settings.rating.value.minimum,
      only_integer: true
    }

  private
    
  def update_rating
    total_rate = product.ratings.sum(&:value)
    rate_count = user.ratings.count
    rate_average = product.update_column :rate_average,
      total_rate / rate_count
  end
end
