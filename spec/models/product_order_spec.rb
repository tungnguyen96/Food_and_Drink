require "rails_helper"

RSpec.describe ProductOrder, type: :model do
  it { is_expected.to belong_to :product }
  it { is_expected.to belong_to :order }

  describe "quantity" do
    it { is_expected.to validate_presence_of :quantity }
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than 0 }
    it { is_expected.to validate_numericality_of(:quantity).only_integer }
  end

  describe "total price" do
    it { is_expected.to validate_presence_of :total_price }
    it { is_expected.to validate_numericality_of(:total_price).is_greater_than 0 }
  end
end
