require "rails_helper"

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to have_many :orders }
  it { is_expected.to have_many :ratings }
  it { is_expected.to have_many :feedbacks }

  describe "name" do
    it { is_expected.to validate_presence_of :name }
  end

  describe "email" do
    it { is_expected.to validate_presence_of :email }

    it "must be unique" do
      user = create(:user)
      dup_user = user.dup
      dup_user.email.upcase!

      expect(dup_user).to_not be_valid
    end
  end

  describe "password" do
    it { is_expected.to validate_confirmation_of :password }
    it { is_expected.to validate_length_of(:password).is_at_least 6 }
  end
end
