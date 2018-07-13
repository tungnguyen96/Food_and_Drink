class Category < ApplicationRecord
  has_many :products
  has_many :children, class_name: Category.name, foreign_key: :parent_id
  belongs_to :parent, class_name: Category.name

  validates :name, presence: true
end
