class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :children, class_name: Category.name, foreign_key: :parent_id,
    dependent: :destroy
  belongs_to :parent, class_name: Category.name, optional: true
  accepts_nested_attributes_for :products
  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
