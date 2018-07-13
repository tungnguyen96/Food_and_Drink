require "rails_helper"

RSpec.describe Order, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :products }
  it { is_expected.to have_many :product_orders }

  it { is_expected.to validate_presence_of :purchased }
end
