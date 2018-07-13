require "rails_helper"

RSpec.describe Rating, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :product }

  describe "value" do
    it { is_expected.to validate_presence_of :value }
    it { is_expected.to validate_numericality_of(:value).only_integer }
    it { is_expected.to validate_numericality_of(:value).is_less_than 6 }
    it { is_expected.to validate_numericality_of(:value).is_greater_than 0 }
  end
end
