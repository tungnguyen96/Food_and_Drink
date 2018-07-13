require "rails_helper"

RSpec.describe Product, type: :model do
  it { is_expected.to belong_to :category }
  it { is_expected.to have_many :orders }
  it { is_expected.to have_many :product_orders }


  describe "name" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of(:name).is_at_least(4) }
  end

  describe "price" do
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_numericality_of(:price).is_greater_than 0 }
    it { is_expected.to validate_numericality_of(:price).only_integer }
  end

  describe "quantity" do
    it { is_expected.to validate_presence_of :quantity }
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than 0 }
    it { is_expected.to validate_numericality_of(:quantity).only_integer }
  end
end
