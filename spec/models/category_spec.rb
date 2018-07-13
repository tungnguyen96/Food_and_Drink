require "rails_helper"

RSpec.describe Category, type: :model do
  let(:category) { build(:category) }

  it { is_expected.to validate_presence_of :name }

  context "when parent is not exist" do
    it { is_expected.to be_valid }
  end
end
